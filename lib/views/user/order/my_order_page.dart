import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/order_list.dart';
import 'package:flutterapp/routes/routes.dart';
import 'package:flutterapp/utils/date_utils.dart';

import '../../../application.dart';

class MyOrderPage extends StatefulWidget {

  final OrderList orderList;

  MyOrderPage(this.orderList);

  @override
  State<MyOrderPage> createState() => new _MyOrderPage();
}

class _MyOrderPage extends State<MyOrderPage> {

  Map<int, String> orderStatusMap = {
    0: '未支付',
    1: '支付完成',
    2: '支付失败',
    3: '支付中',
    4: '订单取消',
    5: '退款中',
    6: '退款完成',
    7: '退款失败',
    8: '已完成 ',
  };

  List<int> _payStatus = [0, 3];
  List<int> _againStatus = [1];
  List<int> _detailStatus = [2, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: 190,
      color: Color.fromRGBO(255, 255, 255, 1),
      margin: EdgeInsets.only(top: 12, bottom: 12),
      child: new Stack(
        children: <Widget>[
          new Positioned(
            top: 15,
            left: 12,
            child: new Text(DateUtils.dateFormat(widget.orderList.createTime),
              style: new TextStyle(
                fontSize: 10,
                color: Color.fromRGBO(155, 155, 155, 1),
              ),
            )
          ),

          new Positioned(
              top: 15,
              right: 12,
              child: new Text(orderStatusMap[widget.orderList.orderStatus],
                style: new TextStyle(
                  fontSize: 10,
                  color: Color.fromRGBO(74, 74, 74, 1),
                ),
              )
          ),


          new Positioned(
              top: 44,
              left: 12,
              child: new Container(
                width: 110, height: 62,
                child: Image.network("${widget.orderList.showImg}",
                  width: 110, height: 62,
                  fit: BoxFit.fill,
                ),
              )
          ),

          new Positioned(
              top: 44,
              left: 134,
              child: new Container(
                width: 229,
                child: new Text("${widget.orderList.showTitle}",
                  style: new TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              )
          ),

          new Positioned(
              top: 92,
              left: 134,
              child: new Text("x${widget.orderList.goodsCount}",
                style: new TextStyle(
                  fontSize: 10,
                  color: Color.fromRGBO(155, 155, 155, 1),
                ),
              )
          ),


          new Positioned(
              top: 89,
              right: 12,
              child: new Container(
                child: new Text("¥${widget.orderList.standardPrice / 100}",
                  style: new TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              )
          ),


          new Positioned(
              top: 117,
              right: 106,
              child: new Container(
                child: new Text("共${widget.orderList.goodsCount}件",
                  style: new TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              )
          ),

          new Positioned(
              top: 122,
              right: 101,
              child: new Container(
                width: 1, height: 8,
                color: Color.fromRGBO(151, 151, 151, 1),
              )
          ),

          new Positioned(
              top: 116,
              right: 12,
              child: new Container(
                child: new Text("总额：¥${widget.orderList.orderAmount / 100}",
                  style: new TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              )
          ),

          new Positioned(
            bottom: 0,
            right: 12,
            child: new ButtonBar(
              children: <Widget>[
                !_payStatus.contains(widget.orderList.orderStatus) ?
                new Container() :
                new MaterialButton(
                  minWidth: 72,
                  height: 21,
                  color: Color.fromRGBO(153, 128, 84, 1),
                  child: new Text('立即支付',
                    style: new TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 12,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.5)),
                  ),
                  onPressed: () {
                  },
                ),
                !_againStatus.contains(widget.orderList.orderStatus) ?
                new Container() :
                new MaterialButton(
                  minWidth: 72,
                  height: 21,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: new Text('再来一单',
                    style: new TextStyle(
                      color: Color.fromRGBO(153, 128, 84, 1),
                      fontSize: 12,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.5)),
                    side: BorderSide(color: Color.fromRGBO(153, 128, 84, 1), width: 0.5),
                  ),
                  onPressed: () {
                  },
                ),
                !_detailStatus.contains(widget.orderList.orderStatus) ?
                new Container() :
                new MaterialButton(
                  minWidth: 46,
                  height: 21,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: new Text('查看',
                    style: new TextStyle(
                      color: Color.fromRGBO(153, 128, 84, 1),
                      fontSize: 12,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.5)),
                    side: BorderSide(color: Color.fromRGBO(153, 128, 84, 1), width: 0.5),
                  ),
                  onPressed: () {
                    Application.router.navigateTo(context,
                      '${Routes.webDetail}?url=${Uri.encodeComponent(widget.orderList.detailUrl)}&title=${Uri.encodeComponent("订单详情")}',
                      transition: TransitionType.nativeModal,
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}