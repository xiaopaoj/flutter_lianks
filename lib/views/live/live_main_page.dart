import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/user_info.dart';

import 'live_list_page.dart';

DefaultTabController _tabController;

class LiveMainPage extends StatefulWidget {
  final UserInfo userInfo;

  LiveMainPage(this.userInfo);

  @override
  State<LiveMainPage> createState() => _LiveMainPage(this.userInfo);
}

class _LiveMainPage extends State<LiveMainPage> with SingleTickerProviderStateMixin {
  UserInfo userInfo;

  _LiveMainPage(this.userInfo);

  List<Tab> _list = [];

  TabController tabController;

  List<Widget> mTabView = [
    new LiveListPage(liveType: 0),
    new LiveListPage(liveType: 1),
    new LiveListPage(liveType: 1, isPast: 1,),
  ]; //使用widget的形式


  @override
  void initState() {
    super.initState();
    _list
      ..add(new Tab(child: new Text("系列课", textAlign: TextAlign.left,) ))
      ..add(new Tab(icon: new Text("课程", textAlign: TextAlign.left,) ))
      ..add(new Tab(icon: new Text("回放", textAlign: TextAlign.left,) ));

    tabController = new TabController(length: _list.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _tabController = new DefaultTabController(
      length: 2,
      child: new Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(108),
          child: new AppBar(
            elevation: 0,
            title: new Container(
              width: 56,
              height: 40,
              margin: EdgeInsets.only(left: 12, top: 12, right: 0, bottom: 12),
              child: new Text(
                "直播",
                textAlign: TextAlign.center,
                softWrap: false,
                maxLines: 1,
                textScaleFactor: 1,
                style: new TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 28,
                  //单词间隙(负值可以让单词更紧凑)
                  wordSpacing: 0.0,
                  //字母间隙(负值可以让字母更紧凑)
                  letterSpacing: 0.0,
                  //字体粗细  粗体和正常
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            actions: <Widget>[
              new Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(left: 0, top: 14, right: 14, bottom: 14),
                child: new CircleAvatar(
                  backgroundImage: NetworkImage(
                    null == userInfo || userInfo.headPicture.isEmpty
                        ? 'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658'
                        : userInfo.headPicture,
                    scale: 30
                  ),
                  radius: 30,
                ),
              ),
            ],
            bottom: new PreferredSize(
              preferredSize: Size.fromHeight(108),
              child: new Container(
                child: new TabBar(
                  tabs: _list,
                  controller: tabController,
                  indicator: new UnderlineTabIndicator(
                      borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(6, 6, 6, 1)),
                      insets: EdgeInsets.only(left: 10, right: 10)
                  ),
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
          controller: tabController,
          children: mTabView,
        ),
      ),
    );
    return _tabController;
  }
}
