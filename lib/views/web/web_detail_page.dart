
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/utils/local_storage_utils.dart';
import 'package:flutterapp/utils/toast_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/js_bridge_util.dart';

class WebDetailPage extends StatefulWidget {

  final String url;

  final String title;

  WebDetailPage(this.url, this.title);

  @override
  State<WebDetailPage> createState() => new _WebDetailPage();
}

class _WebDetailPage extends State<WebDetailPage> {

  WebViewController _controller;



  @override
  void initState() {
    super.initState();

  }

  wxShareSession(){
    print("123123123123123123123123123123123123123123123");
    ToastUtils.showMessage("点击了按钮");
  }

  @override
  Widget build(BuildContext context) {

    JavascriptChannel _jsBridge(BuildContext context) => JavascriptChannel(
        name: 'WebViewJavascriptBridge', // 与h5 端的一致 不然收不到消息
        onMessageReceived: (JavascriptMessage msg) async{
          String jsonStr = msg.message;
          JsBridgeUtil.executeMethod(context, JsBridgeUtil.parseJson(jsonStr));
    });

    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title,
          style: new TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: new IconButton(
            icon: Image.asset("assets/images/icon/default/icon_fanhui@3x.png", width: 20, height: 20,),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        actions: <Widget>[
          new IconButton(
              icon: Image.asset("assets/images/icon/default/icon_fengxiang@3x.png", width: 20, height: 20,),
              onPressed: () {
                _controller.evaluateJavascript("javascript:device()");
              }
          )
        ],
      ),
      body: new WebView(
        initialUrl: widget.url,
        userAgent: "flutter",
        debuggingEnabled: true,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        onPageFinished: (String value) {
          _controller.evaluateJavascript("document.cookie = 'Token=${LocalStorageUtils.getToken()}'");
          _controller.evaluateJavascript("document.cookie = 'appName=lianks'");
        },
        javascriptChannels: <JavascriptChannel>[
          _jsBridge(context) // 与h5 通信
        ].toSet(),
      ),
    );
  }




}
