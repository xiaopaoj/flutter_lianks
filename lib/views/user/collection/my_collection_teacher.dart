
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/page.dart';
import 'package:flutterapp/model/teacher.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/views/teacher/teacher_page.dart';

class MyCollectionTeacher extends StatefulWidget {


  @override
  State<MyCollectionTeacher> createState() => new _MyCollectionTeacher();
}

class _MyCollectionTeacher extends State<MyCollectionTeacher> {

  ScrollController _scrollController;

  Page _page;

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
    DataUtils.getCollectionsList(_pageNum, _pageSize, 1, 0).then((r) {
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
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
        title: new Text("关注导师",
          style: new TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: new RefreshIndicator(

        child: new CustomScrollView(
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          slivers: <Widget>[
            null != _list ?
            new SliverList(
              delegate: new SliverChildBuilderDelegate(
                    (context, index) {
                  return new TeacherPage(Teacher.fromMap(_list[index]));
                },
                childCount: _list.length,
              ),
            ) : new SliverToBoxAdapter(),

          ],
        ),
        onRefresh: _handleRefresh,
      ),
    );
  }

  Future<Null> _handleRefresh() async {

    await Future.delayed(Duration(seconds: 1), () {
    });

  }
}