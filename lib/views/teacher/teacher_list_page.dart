
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/page.dart';
import 'package:flutterapp/model/teacher.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/views/teacher/teacher_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TeacherListPage extends StatefulWidget {

  final int teacherType;

  TeacherListPage(this.teacherType);

  @override
  State<TeacherListPage> createState() => new _TeacherListPage();
}

class _TeacherListPage extends State<TeacherListPage> {


//  ScrollController _scrollController = new ScrollController();

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  PageBean _page;

  int _pageNum = 1;

  int _pageSize = 5;

  List<dynamic> _list = [];

  bool reload = false;

  @override
  void initState() {
    super.initState();
    _getList();
  }

  @override
  void dispose() {
    _refreshController?.dispose();
    super.dispose();
  }

  void _getList() {
    if(reload) {
      return;
    }
    reload = true;
    DataUtils.getTeacherList(_pageNum, _pageSize, widget.teacherType, null).then((r) {
      if(mounted) {
        setState(() {
          _page = r;
          if(r.dataList.length == 0) {
            _refreshController.loadNoData();
          } else {
            _list.addAll(_page.dataList);
            _refreshController.refreshCompleted();
            _refreshController.loadComplete();
          }
          reload = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return  new SmartRefresher(
//      color: Color.fromRGBO(244, 245, 247, 1),
      enablePullDown: true,
      enablePullUp: true,
      header: ClassicHeader(
        releaseText: "下拉刷新",
        canTwoLevelText: "abc",
        refreshingText: "刷新中",
        completeText: '刷新完成',
        failedText: '刷新失败',
        idleText: '下拉刷新',
      ),
      footer: ClassicFooter(
        canLoadingText: "上拉加载更多",
        loadingText: "加载中...",
        noDataText: "加载完了",
        failedText: '加载失败',
        idleText: '上拉加载更多',
      ),
      child: new CustomScrollView(
        physics: new AlwaysScrollableScrollPhysics(),
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
      controller: _refreshController,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2), () {
          _pageNum = 1;
          _list = [];
          _getList();
        });
      },
      onLoading: () async {
        await Future.delayed(Duration(seconds: 2), () {
          _pageNum = _pageNum + 1;
          _getList();
        });
      },
    );
  }

}