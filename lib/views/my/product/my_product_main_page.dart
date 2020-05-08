
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_product_list_page.dart';

class MyProductMainPage extends StatefulWidget {

  final String title;

  final int type;

  MyProductMainPage(this.title, this.type);

  @override
  State<MyProductMainPage> createState() => new _MyProductMainPage();
}

class _MyProductMainPage extends State<MyProductMainPage> with SingleTickerProviderStateMixin {

  List<Tab> _list = [];

  TabController _tabController;


  List<Widget> mTabView = []; //使用widget的形式

  @override
  void initState() {
    super.initState();

    _list
      ..add(new Tab(child: new Text("全部", textAlign: TextAlign.left,) ))
      ..add(new Tab(icon: new Text("已开课", textAlign: TextAlign.left,) ))
      ..add(new Tab(icon: new Text("未开课", textAlign: TextAlign.left,) ));

    mTabView
      ..add(new MyProductListPage(widget.type, 0))
      ..add(new MyProductListPage(widget.type, 1))
      ..add(new MyProductListPage(widget.type, 2));

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
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(108),
          child: new AppBar(
            elevation: 0,
            centerTitle: true,
            title: new Text(widget.title,
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