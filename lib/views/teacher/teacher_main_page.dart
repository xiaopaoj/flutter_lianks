import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/views/teacher/teacher_list_page.dart';

import '../../application.dart';

class TeacherMainPage extends StatefulWidget {

  @override
  State<TeacherMainPage> createState() => _TeacherMainPage();
}

class _TeacherMainPage extends State<TeacherMainPage>
    with SingleTickerProviderStateMixin {

  List<Tab> _list = [];

  ScrollController _scrollViewController;

  TabController _tabController;


  List<Widget> mTabView = []; //使用widget的形式

  @override
  void initState() {
    super.initState();
    DataUtils.getTeacherTags().then((tags) {
      setState(() {
        _list.addAll(tags.map((tag) {
          return new Tab(
              child: new Text(
            tag.dictName,
            textAlign: TextAlign.left,
          ));
        }).toList());

        mTabView.addAll(tags.map((tag) {
          return new TeacherListPage(int.parse(tag.dictValue));
        }).toList());

        _scrollViewController = ScrollController();
        _tabController = TabController(vsync: this, length: _list.length); // 和下面的 TabBar.tabs 数量对应
      });
    });
  }

  @override
  void dispose() {
    _scrollViewController?.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _list.length <= 0
        ? new Container()
        : new SizedBox(
            child: new Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: new PreferredSize(
                preferredSize: Size.fromHeight(108),
                child: new AppBar(
                  elevation: 0,
                  title: new Container(
                    width: 56,
                    height: 40,
                    margin: EdgeInsets.only(
                        left: 12, top: 12, right: 0, bottom: 12),
                    child: new Text(
                      "导师",
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
                            null == Application.userInfo || Application.userInfo.headPicture.isEmpty
                                ? 'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658'
                                : Application.userInfo.headPicture,
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
