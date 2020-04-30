import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LivingLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color.fromRGBO(255, 169, 0, 1),
      height: 24,
      child: new Row(
        children: <Widget>[
          new Flexible(
              flex: 1,
              child: new Align(
                alignment: Alignment.bottomLeft,
                child: new Stack(
                  children: <Widget>[
                    new Positioned(
                      child: Image.asset("assets/images/icon/default/sanjiao@3x.png",
                        width: 11, height: 8,),
                      bottom: 0,
                      left: 12,
                    )
                  ],
                ),
              )
          ),
          new Flexible(
              flex: 2,
              child: new Align(
                alignment: Alignment.center,
                child: new Text(
                  "直播中...",
                  style: new TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    wordSpacing: 0,
                    letterSpacing: 0,
                  ),
                ),
              )),
          new Flexible(
              flex: 1,
              child: new Align(
                alignment: Alignment.centerRight,
                child: new Container(
                  width: 48,
                  height: 15,
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Color.fromRGBO(255, 255, 255, 1), width: .5),
                    borderRadius: new BorderRadius.circular(10.5),
                  ),
                  margin: EdgeInsets.only(top: 5, bottom: 4, right: 12),
                  child: new Container(
                    width: 32,
                    height: 11,
                    margin: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 8),
                    child: new Text(
                      "查看全部",
                      textAlign: TextAlign.left,
                      softWrap: false,
                      maxLines: 1,
                      textScaleFactor: 1,
                      style: new TextStyle(
                        fontSize: 8,
                        color: Color.fromRGBO(255, 255, 255, 1),
                        wordSpacing: 0,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
