import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/dict.dart';
import 'package:flutterapp/model/live_class.dart';
import 'package:flutterapp/model/page.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/views/live/live_class_page.dart';

class MyCollectionProductPage extends StatefulWidget {


  @override
  State<MyCollectionProductPage> createState() => _MyCollectionProductPage();
}

class _MyCollectionProductPage extends State<MyCollectionProductPage> {

  ScrollController _scrollController;

  List<Dict> _tags = [];

  String _choice = "0";

  Page _page;

  int _pageNum = 1;

  int _pageSize = 5;

  List<dynamic> _list = [];

  @override
  void initState() {
    super.initState();

    DataUtils.getCollectionsTags().then((tags) {
      setState(() {
        _tags = tags;
      });
    });

    _scrollController = new ScrollController();

    _getList();
  }

  void _getList() async {
    DataUtils.getCollectionsList(_pageNum, _pageSize, 2, int.parse(_choice)).then((r) {
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
        title: new Text("收藏课程",
          style: new TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: new PreferredSize(
          preferredSize: Size.fromHeight(108),
          child: new Container(
            child: new Wrap(
              spacing: 8.0,
              children: _tags.map((tag) {
                return new ChoiceChip(
                  label: new Text(tag.dictName),
                  labelStyle: new TextStyle(
                    fontSize: 12,
                    color: _choice == tag.dictValue
                        ? Color.fromRGBO(255, 255, 255, 1)
                        : Color.fromRGBO(155, 155, 155, 1),
                  ),
                  selectedColor: Color.fromRGBO(153, 128, 84, 1),
                  selected: _choice == tag.dictValue,
                  backgroundColor: Color.fromRGBO(246, 246, 246, 1),
                  onSelected: (value) {
                    setState(() {
                      _choice = tag.dictValue;
                      _handleRefresh();
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
      body: new RefreshIndicator(
        color: Color.fromRGBO(244, 245, 247, 1),
        child: new CustomScrollView(
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          slivers: <Widget>[
            null != _list ?
            new SliverList(
              delegate: new SliverChildBuilderDelegate(
                    (context, index) {
                  return new LivingClassPage(
                      LiveClass.fromCollectionListApi(_list[index], "直播课详情"));
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
      _pageNum = 1;
      _list = [];
      _getList();
    });

  }
}