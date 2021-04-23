import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter_lianks/application.dart';
import 'package:flutter_lianks/routes/routes.dart';
import 'package:flutter_lianks/views/web/share_page.dart';

import 'Js_bridge.dart';
import 'toast_utils.dart';

class JsBridgeUtil {
  /// 将json字符串转化成对象
  static JsBridge parseJson(String jsonStr) {
    JsBridge jsBridgeModel = JsBridge.fromMap(jsonDecode(jsonStr));
    return jsBridgeModel;
  }

  /// 向H5开发接口调用
  static executeMethod(context, JsBridge jsBridge) async {
    if (jsBridge.method == 'LianksAppHandler') {
      print("jsBridge.data===========${jsBridge.data}");
      int actionType = jsBridge.data['actionType'];
      if(actionType == 1) {
        // 分享朋友圈
        List content = jsBridge.data['content'];
        if(content[1] == null || content[1] == "") {
          return;
        }
        // 唤起分享窗口
        share(context, content);
      } else if(actionType == 9) {
        // 查看回放
        List content = jsBridge.data['content'];
        Application.router.navigateTo(context,
          '${Routes.liveVideo}?url=${Uri.encodeComponent(
              content[1])}',
          transition: TransitionType.nativeModal,
        );
      }else {
        ToastUtils.showMessage("其他调用");
      }

    }
    jsBridge.success?.call();
  }
}