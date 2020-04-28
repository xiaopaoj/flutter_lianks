
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebDetail extends StatefulWidget {

  final String url;

  final String title;

  WebDetail(this.url, this.title);

  @override
  State<WebDetail> createState() => new _WebDetail();
}

class _WebDetail extends State<WebDetail> {

  final _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    _controller.future.then((controller){
      controller.evaluateJavascript("document.cookie = 'Token=${DataUtils.token}'");
      controller.evaluateJavascript("document.cookie = 'appName=lianks'");
    });

    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            }),

      ),
      body: new WebView(
        initialUrl: widget.url,
        userAgent: "Android",
        debuggingEnabled: true,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller.complete(controller);
        },
        onPageFinished: (String value) {
        },
      ),
    );
  }
}