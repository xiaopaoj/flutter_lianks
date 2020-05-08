import 'dart:async';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/event/event_model.dart';
import 'package:flutterapp/routes/routes.dart';
import 'package:flutterapp/utils/local_storage_utils.dart';
import 'package:flutterapp/utils/toast_utils.dart';
import 'package:path_provider/path_provider.dart';

import '../application.dart';

//Map<String, dynamic> optHeader = {
//  'accept-language': 'zh-cn',
//  'content-type': 'application/json'
//};

Dio dio;


class NetUtils {

  static Dio getDio(){
    if(dio == null) {
      dio = new Dio(BaseOptions(connectTimeout: 30000));
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          LocalStorageUtils.getToken().then((r) {
            if(null != r && "" != r) {
              options.headers = {
                "Authorization-token" : r
              };
            }
          });
          return options;
        },
        onResponse:(Response response) async {
          print("interceptors==============>${response.data}");
          int code = response.data['code'];
          if(code == 401) {
            // 未登录，跳转登录页面
            ToastUtils.showMessage("未登录或登录失效，请重新登录");
//          Application.router.navigateTo(Application.context,
//            '${Routes.webDetail}',
//            transition: TransitionType.nativeModal,
//          );
            Application.eventBus.fire(NoLoginEvent());
          }
          return response; // continue
        },
      ));
    }
    return dio;
  }


  static Future get(String url, [Map<String, dynamic> params]) async {
    var response;

    // 设置代理 便于本地 charles 抓包
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.findProxy = (uri) {
    //     return "PROXY 30.10.24.79:8889";
    //   };
    // };

//    Directory documentsDir = await getApplicationDocumentsDirectory();
//    String documentsPath = documentsDir.path;
//    var dir = new Directory("$documentsPath/cookies");
//    await dir.create();
//    dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));
    if (params != null) {
      response = await getDio().get(url, queryParameters: params);
    } else {
      response = await getDio().get(url);
    }
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    // // 设置代理 便于本地 charles 抓包
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.findProxy = (uri) {
    //     return "PROXY 30.10.24.79:8889";
    //   };
    // };
//    Directory documentsDir = await getApplicationDocumentsDirectory();
//    String documentsPath = documentsDir.path;
//    var dir = new Directory("$documentsPath/cookies");
//    await dir.create();
//    dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));
    var response = await getDio().post(url, data: params, options: new Options(
      contentType: "application/json"
    ));
    return response.data;
  }
}
