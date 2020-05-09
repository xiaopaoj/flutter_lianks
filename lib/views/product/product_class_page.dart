
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/product.dart';
import 'package:flutterapp/routes/routes.dart';

import '../../application.dart';

class ProductClassPage extends StatefulWidget {

  final Product product;

  ProductClassPage(this.product);

  @override
  State<ProductClassPage> createState() => new _ProductClassPage();
}

class _ProductClassPage extends State<ProductClassPage> {

  @override
  Widget build(BuildContext context) {
    if(null == widget.product) {
      return Container();
    }
    return new GestureDetector(
      onTap: (){
        Application.router.navigateTo(context,
          '${Routes.webDetail}?url=${Uri.encodeComponent(
              widget.product.detailUrl)}&title=${Uri.encodeComponent(
              widget.product.productName)}&showShare=1',
          transition: TransitionType.nativeModal,
        );
      },
      child: new Container(
        height: 277,
        color: Color.fromRGBO(255, 255, 255, 1),
        width: MediaQuery.of(context).size.width,
        child: new Column(
          children: <Widget>[
            new Expanded(
              flex: 71,
              child: new Stack(
                children: <Widget>[
                  new Container(
                    width: double.infinity,
                    child: new Image.network(widget.product.listImage,
                      width: 315,
                      height: 197,
                      fit: BoxFit.fill,
                    ),
                    margin: EdgeInsets.only(left: 12, top: 9, right: 12, bottom: 12),
                  ),
                  new Positioned(
                    child: new Opacity(
                      opacity: 0.16,
                      child: new Container(
                        width: 351,
                        height: 48,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    top: 137,
                    left: 12,
                    right: 12,
                  ),
                  new Positioned(
                    child: new Container(
                      width: 300,
                      child: new Text(widget.product.productName,
                        style: new TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 19,
                          //单词间隙(负值可以让单词更紧凑)
                          wordSpacing: -0.3,
                          //字母间隙(负值可以让字母更紧凑)
                          letterSpacing: -0.3,
                          //字体粗细  粗体和正常
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    top: 140,
                    left: 24,
                  ),
                ],
              ),
            ),
            new Expanded(
              flex: 29,
              child: new Column(
                children: <Widget>[
                  new Stack(
                    children: <Widget>[
                      new Container(
                        width: double.infinity,
                        height: 20,
                        child: new Text(widget.product.teacherName,
                          style: new TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(74, 74, 74, 1),
                            //单词间隙(负值可以让单词更紧凑)
                            wordSpacing: -0.22,
                            //字母间隙(负值可以让字母更紧凑)
                            letterSpacing: -0.22,
                            //字体粗细  粗体和正常
                            fontWeight: FontWeight.w500,
                          ),),

                        margin: EdgeInsets.only(left: 12, bottom: 6),
                      ),
                      null == widget.product.originalPrice ||
                          0 == int.parse(widget.product.originalPrice)
                          ? new Container() :
                      new Positioned(
                        child: new Container(
                        height: 20,
                        child: new Text(
                          "¥" + (int.parse(widget.product.originalPrice) / 100).toString(),
                          style: new TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(169, 169, 169, 1),
                            //单词间隙(负值可以让单词更紧凑)
                            wordSpacing: -0.22,
                            //字母间隙(负值可以让字母更紧凑)
                            letterSpacing: -0.22,
                            //字体粗细  粗体和正常
                            fontWeight: FontWeight.w500,
                          ),),

                        margin: EdgeInsets.only(left: 12, bottom: 6, right: 8),
                        ),
                        right: 58,
                      ),
                      new Positioned(
                        child: new Container(
                          height: 20,
                          child: new Text(
                            null == widget.product.standardPrice ||
                                0 == int.parse(widget.product.standardPrice)
                                ? "免费" :
                            "¥" + (int.parse(widget.product.standardPrice) / 100).toString(),
                            style: new TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(146, 101, 0, 1),
                              //单词间隙(负值可以让单词更紧凑)
                              wordSpacing: -0.22,
                              //字母间隙(负值可以让字母更紧凑)
                              letterSpacing: -0.22,
                              //字体粗细  粗体和正常
                              fontWeight: FontWeight.w500,
                            ),),

                          margin: EdgeInsets.only(left: 12, bottom: 6),
                        ),
                        right: 12,
                      ),
                    ],
                  ),
                  new Expanded(
                    child:  new Container(
                      width: double.infinity,
                      height: 20,
                      margin: EdgeInsets.only(left: 12),
                      child: new Text(_getDateStr(widget.product.classDateStart, widget.product.classDateEnd),
                        style: new TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(74, 74, 74, 1),
                          //单词间隙(负值可以让单词更紧凑)
                          wordSpacing: -0.22,
                          //字母间隙(负值可以让字母更紧凑)
                          letterSpacing: -0.22,
                          //字体粗细  粗体和正常
                          fontWeight: FontWeight.w500,
                        ),),
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      width: double.infinity,
                      height: 20,
                      child: new Text(widget.product.address,
                        style: new TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(74, 74, 74, 1),
                          //单词间隙(负值可以让单词更紧凑)
                          wordSpacing: -0.22,
//                          字母间隙(负值可以让字母更紧凑)
                          letterSpacing: -0.22,
                          //字体粗细  粗体和正常
                          fontWeight: FontWeight.w600,
                        ),),

                      margin: EdgeInsets.only(left: 12),
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  String _getDateStr( int classDateStart, int classDateEnd){
    DateTime start = DateTime.fromMicrosecondsSinceEpoch(classDateStart * 1000);
    DateTime end = DateTime.fromMicrosecondsSinceEpoch(classDateEnd * 1000);
   // 2019/10/25-11/27
    return "${start.year}/${start.month}/${start.day}-${end.month}/${end.day}";
  }

}