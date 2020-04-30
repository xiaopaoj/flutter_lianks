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

Map<String, dynamic> optHeader = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json'
};

Dio dio = new Dio(BaseOptions(connectTimeout: 30000, headers: optHeader));


class NetUtils {


  static Future get(String url, [Map<String, dynamic> params]) async {

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        String token = "abd"; //LocalStorageUtils.getToken();
        if(null != token && "" != token) {
          optHeader.addAll({
            "Authorization-token" : token
          });
          options.headers = optHeader;
        }
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
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
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
    var response = await dio.post(url, data: params);
    return response.data;
  }
}
