
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lianks/views/user/order/my_order_list_page.dart';


class MyOrderMainPage extends StatefulWidget {


  @override
  State<MyOrderMainPage> createState() => new _MyOrderMainPage();
}

class _MyOrderMainPage extends State<MyOrderMainPage> with SingleTickerProviderStateMixin {

  List<Tab> _list = [];

  TabController _tabController;


  List<Widget> mTabView = []; //使用widget的形式

  @override
  void initState() {
    super.initState();

    _list
      ..add(new Tab(child: new Text("全部", textAlign: TextAlign.left,) ))
      ..add(new Tab(icon: new Text("待支付", textAlign: TextAlign.left,) ))
      ..add(new Tab(icon: new Text("已支付", textAlign: TextAlign.left,) ));

    mTabView
      ..add(new MyOrderListPage(0))
      ..add(new MyOrderListPage(1))
      ..add(new MyOrderListPage(2));

    _tabController = TabController(vsync: this, length: _list.length); // 和下面的 TabBar.tabs 数量对应
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      child: new Scaffold(
//        backgroundColor: Theme.of(context).backgroundColor,
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(108),
          child: new AppBar(
            elevation: 0,
            centerTitle: true,
            title: new Text("订单",
              style: new TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
            bottom: new PreferredSize(
              preferredSize: Size.fromHeight(108),
              child: new Container(
                child: new TabBar(
                  isScrollable: true,
                  tabs: _list,
                  controller: _tabController,
                  indicator: new UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 1.0, color: Color.fromRGBO(6, 6, 6, 1)),
                      insets: EdgeInsets.only(left: 10, right: 10)),
                  labelStyle: new TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  unselectedLabelStyle: new TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(160, 160, 160, 1),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: mTabView,
        ),
      ),
    );
  }
}