
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/model/page.dart';
import 'package:flutterapp/model/product.dart';
import 'package:flutterapp/model/teacher.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/views/product/product_class_page.dart';
import 'package:flutterapp/views/teacher/teacher_page.dart';

class TeacherListPage extends StatefulWidget {

  final int teacherType;

  TeacherListPage(this.teacherType);

  @override
  State<TeacherListPage> createState() => new _TeacherListPage();
}

class _TeacherListPage extends State<TeacherListPage> {


  ScrollController _scrollController = new ScrollController();

  Page _page;

  int _pageNum = 1;

  int _pageSize = 5;

  List<dynamic> _list = [];

  @override
  void initState() {
    super.initState();
    _getList();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  void _getList() async {
    DataUtils.getTeacherList(_pageNum, _pageSize, widget.teacherType, null).then((r) {
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
                return new TeacherPage(
                    Teacher.fromMap(_list[index]));
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