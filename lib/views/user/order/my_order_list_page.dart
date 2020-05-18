
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/order_list.dart';
import 'package:flutterapp/model/page.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/views/user/order/my_order_page.dart';

class MyOrderListPage extends StatefulWidget {

  final int orderStatus;

  MyOrderListPage(this.orderStatus);

  @override
  State<MyOrderListPage> createState() => new _MyOrderListPage();
}

class _MyOrderListPage extends State<MyOrderListPage> {

  ScrollController _scrollController;

  PageBean _page;

  int _pageNum = 1;

  int _pageSize = 5;

  List<dynamic> _list = [];

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _getList();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  void _getList() async {
    DataUtils.getMyOrderList(_pageNum, _pageSize, widget.orderStatus).then((r) {
      if(mounted) {
        setState(() {
          _page = r;
          _list.addAll(_page.dataList);
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      color: Color.fromRGBO(244, 245, 247, 1),
      child: new CustomScrollView(
        physics: new AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        slivers: <Widget>[
          null != _list ?
          new SliverList(
            delegate: new SliverChildBuilderDelegate(
                  (context, index) {
                return new MyOrderPage(OrderList.fromMap(_list[index]));
              },
              childCount: _list.length,
            ),
          ) : new SliverToBoxAdapter(),

        ],
      ),
      onRefresh: _handleRefresh,
    );
  }

  Future<Null> _handleRefresh() async {

    await Future.delayed(Duration(seconds: 1), () {
      _pageNum = 1;
      _list = [];
      _getList();
    });

  }
}