
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lianks/application.dart';
import 'package:flutter_lianks/utils/data_utils.dart';
import 'package:flutter_lianks/utils/local_storage_utils.dart';
import 'package:flutter_lianks/utils/toast_utils.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/js_bridge_util.dart';

class WebDetailPage extends StatefulWidget {

  final String url;

  final String title;

  final int showShare;

  WebDetailPage(this.url, this.title, {this.showShare});

  @override
  State<WebDetailPage> createState() => new _WebDetailPage();
}

class _WebDetailPage extends State<WebDetailPage> {

  // WebViewController _controller;



  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  wxShareSession(){
    ToastUtils.showMessage("点击了按钮");
  }

  @override
  Widget build(BuildContext context) {

    // JavascriptChannel _jsBridge(BuildContext context) => JavascriptChannel(
    //     name: 'WebViewJavascriptBridge', // 与h5 端的一致 不然收不到消息
    //     onMessageReceived: (JavascriptMessage msg) async{
    //       String jsonStr = msg.message;
    //       JsBridgeUtil.executeMethod(context, JsBridgeUtil.parseJson(jsonStr));
    // });


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
          widget.showShare == null || widget.showShare != 1 ?
          new Container() :
          new IconButton(
              icon: Image.asset("assets/images/icon/default/icon_fengxiang@3x.png", width: 20, height: 20,),
              onPressed: () {
                // _controller.evaluateJavascript("javascript:device()");
              }
          )
        ],
      ),
      // body: new WebView(
      //   initialUrl: widget.url,
      //   userAgent: "flutter",
      //   debuggingEnabled: true,
      //   javascriptMode: JavascriptMode.unrestricted,
      //   onWebViewCreated: (controller) {
      //     _controller = controller;
      //     print('Token=${Application.userInfo?.token}');
      //     _controller.evaluateJavascript("document.cookie = 'Token=${Application.userInfo?.token}'");
      //     _controller.evaluateJavascript("document.cookie = 'appName=lianks'");
      //   },
      //   onPageFinished: (String value) {
      //   },
      //   javascriptChannels: <JavascriptChannel>[
      //     _jsBridge(context),
      //   ].toSet(),
      //   navigationDelegate: (NavigationRequest request) {
      //     print('allowing navigation to $request');
      //     return NavigationDecision.navigate;
      //   },
      // ),
    );
  }




}
