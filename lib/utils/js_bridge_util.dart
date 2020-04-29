import 'dart:convert';

import 'package:flutterapp/views/web/share_page.dart';

import '../views/web/Js_bridge.dart';
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
      int actionType = jsBridge.data['actionType'];
      if(actionType == 1) {
        List content = jsBridge.data['content'];
        if(content[1] == null || content[1] == "") {
          return;
        }
        // 唤起分享窗口
        share(context, content);
      } else {
        ToastUtils.showMessage("其他调用");
      }

    }
    jsBridge.success?.call();
  }
}