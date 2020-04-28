import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/views/web/web_detail_page.dart';

var webDetailHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new WebDetailPage(params["url"].first, params["title"].first);
  },
);