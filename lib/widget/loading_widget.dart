import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutterapp/application.dart';

class LoadingWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: window.physicalSize.height,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
            new Container(
              padding: EdgeInsets.only(top: 10.0),
              child: new Text("reloading"),
            )
          ],
        ),
      ),
    );
  }
}