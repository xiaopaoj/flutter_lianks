
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  @override
  Widget build(BuildContext context) {


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
        userAgent: "Android",
        debuggingEnabled: true,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        onPageFinished: (String value) {
          _controller.evaluateJavascript("document.cookie = 'Token=${DataUtils.token}'");
          _controller.evaluateJavascript("document.cookie = 'appName=lianks'");
        },
        javascriptChannels: <JavascriptChannel>[
          JavascriptChannel(
            name: "WebViewJavascriptBridge",
            onMessageReceived: (JavascriptMessage message) {
              print('WebViewJavascriptBridge参数： ${message.message}');
            },
          ),
        ].toSet(),
      ),
    );
  }

}