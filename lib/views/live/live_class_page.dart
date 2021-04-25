import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lianks/application.dart';
import 'package:flutter_lianks/model/live_class.dart';
import 'package:flutter_lianks/routes/routes.dart';

class LivingClassPage extends StatefulWidget {

  final LiveClass liveClass;

  LivingClassPage(this.liveClass);

  @override
  State<LivingClassPage> createState() => new _LivingClassPage();
}

class _LivingClassPage extends State<LivingClassPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(null == widget.liveClass) {
      return Container();
    }
    return new GestureDetector(
      onTap: (){
        Application.router.navigateTo(context,
          '${AppRoutes.webDetail}?url=${Uri.encodeComponent(
              widget.liveClass.detailUrl)}&title=${Uri.encodeComponent(
              widget.liveClass.title)}&showShare=1',
          transition: TransitionType.nativeModal,
        );
      },
      child: new Container(
        height: 90,
        color: Color.fromRGBO(255, 255, 255, 1),
        width: MediaQuery.of(context).size.width,
        child: new Row(
          children: <Widget>[
            new Expanded(
                flex: 33,
                child: new Stack(
                  alignment:Alignment.center,
                  children: <Widget>[
                    new Container(
                      child: new Image.network(widget.liveClass.showImage,
                        width: 126,
                        height: 72,
                        fit: BoxFit.fill,
                      ),
                      margin: EdgeInsets.only(left: 12, top: 12, right: 0, bottom: 12),
                    ),
                    null != widget.liveClass.tagName || null != widget.liveClass.teacherName
                        ? new Container() :
                    new Positioned(
                      child: new Opacity(
                        opacity: 0.1,
                        child: new Container(
                          width: 126,
                          height: 13,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      bottom: 13,
                      left: 12,
                    ),
                    null == widget.liveClass.teacherName
                        ? new Container() :
                    new Positioned(
                      child: new Text(widget.liveClass.teacherName,
                        style: new TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                      bottom: 12,
                      left: 18,
                    ),
                    null == widget.liveClass.tagName || "" == widget.liveClass.tagName
                        ? new Container() :
                    new Positioned(
                      child: new Opacity(
                        opacity: 1,
                        child: new Container(
                          width: 47,
                          height: 13,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          child: new Align(
                            alignment: Alignment.center,
                            child: new Text(widget.liveClass.tagName,
                              style: new TextStyle(
                                color: Color.fromRGBO(246, 246, 246, 1),
                                fontSize: 6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      bottom: 13,
                      right: 0,
                    ),
                  ],
                )
            ),
            new Expanded(
                flex: 67,
                child: new Container(
                  height: 72,
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        height: 23,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 4, left: 9, top: 0),
                        child: new Text(widget.liveClass.firstLabel,
                          style: new TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(74, 74, 74, 1),
                          ),
                        ),
                      ),
                      new Container(
                        height: 20,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 5, left: 8),
                        child: new Text(widget.liveClass.secondLabel,
                          style: new TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(96, 96, 96, 1),
                          ),
                        ),
                      ),
                      new Container(
                        child: new Container(
                          height: 20,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 8),
                          child: new Stack(
                            children: <Widget>[
                              new Positioned(
                                child: new Text(widget.liveClass.thirdLabel,
                                  style: new TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(96, 96, 96, 1),
                                  ),
                                ),
                              ),
                              null == widget.liveClass.originalPrice ||
                                  0 == int.parse(widget.liveClass.originalPrice)
                                  ? new Container() :
                              new Positioned(
                                child: new Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: new Text(
                                    "¥" + (int.parse(widget.liveClass.originalPrice) / 100).toString(),
                                    style: new TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(169, 169, 169, 1),
                                    ),
                                  ),
                                ),
                                right: 66,
                              ),
                              new Positioned(
                                child: new Text(
                                  null == widget.liveClass.standardPrice ||
                                      0 == int.parse(widget.liveClass.standardPrice)
                                      ? "免费" :
                                  "¥" + (int.parse(widget.liveClass.standardPrice) / 100).toString(),
                                  style: new TextStyle(
                                    fontSize: 13,
                                    color: Color.fromRGBO(146, 101, 0, 1),
                                  ),
                                ),
                                right: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}