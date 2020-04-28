import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/views/first_page/web_detail.dart';

var webDetailHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new WebDetail(params["url"].first, params["title"].first);
  },
);