import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/model/live_class.dart';
import 'package:flutterapp/model/live_top.dart';
import 'package:flutterapp/model/page.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/views/live/live_class_page.dart';
import 'package:flutterapp/views/live/live_top_page.dart';

class LivePackPage extends StatefulWidget {

  final int liveType;

  final int isPast;

  const LivePackPage({Key key, this.liveType, this.isPast}) : super(key: key);

  @override
  State<LivePackPage> createState() => new _LivePackPage();
}

class _LivePackPage extends State<LivePackPage> {

  ScrollController _scrollController = new ScrollController();

  List<BannerListBean> _bannerList;

  LivingBean _living;

  Page _page;

  int _pageNum = 1;

  int _pageSize = 5;

  List<dynamic> _list = [];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if(null == _page ||
            _page.pages > _pageNum) {
            _pageNum = _pageNum + 1;
          _getList();

        }
      }
    });

    DataUtils.getLiveTop().then((r) {
      setState(() {
        _bannerList = r.bannerList;
        _living = r.living;
      });
    });

    _getList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _list = [];
    super.dispose();
  }

  void _getList() async {
    DataUtils.getLiveList(_pageNum, _pageSize, widget.liveType,
        widget.isPast).then((r) {
      setState(() {
        _page = r;
        _list.addAll(_page.dataList);
      });
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
          new SliverToBoxAdapter(
            child: new Container(
              child: _bannerView(),
            ),
          ),

          new SliverToBoxAdapter(
            child:
            null != _living ? new Container(
              height: 24,
              margin: EdgeInsets.only(top: 4),
              child: new LivingLabel(),
            ) : new Container(),
          ),

          new SliverToBoxAdapter(
            child:
            null != _living ? new Container(
              height: 90,
              margin: EdgeInsets.only(top: 4),
              child: new LivingClassPage(LiveClass.fromLivingBean(_living, "直播课详情")
              ),
            ) : new Container(),
          ),

          new SliverToBoxAdapter(
            child:
            new Container(
                margin: EdgeInsets.only(top: 12),
                color: Color.fromRGBO(255, 255, 255, 1),
                child: new Container(
                  width: 90,
                  height: 25,
                  margin: EdgeInsets.only(top: 16, bottom: 13, left: 12),
                  child: new Text(
                    widget.liveType == 0 ? "系列课列表"
                        : widget.isPast == 1 ? "回放列表" : "课程列表",
                    style: new TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      //字体粗细  粗体和正常
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
            ),
          ),
          null != _list ?
          new SliverList(
            delegate: new SliverChildBuilderDelegate(
                  (context, index) {
                return new LivingClassPage(
                    LiveClass.fromLiveListApi(_list[index], widget.liveType == 0 ? "系列课详情" : "直播课详情"));
              },
              childCount: _list.length,
            ),
          ) : new SliverToBoxAdapter(),

        ],
      ),
      onRefresh: _handleRefresh,
    );
  }

  Widget _bannerView() {
    if(_bannerList != null) {
      return new Container(
        child: new Container(
          child: new Swiper(
            itemWidth: MediaQuery.of(context).size.width,
            itemHeight: 212,
            itemCount: _bannerList.length,
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                _bannerList[index].imgUrl,
                fit: BoxFit.fill,
              );
            },
            pagination: new SwiperPagination(),
            control: new SwiperControl(),
          ),
          height: 212,
        ),
      );
    }
    return new Container();
  }

  Future<Null> _handleRefresh() async {

    await Future.delayed(Duration(seconds: 1), () {
      _pageNum = 1;
      _list = [];
      _getList();
    });

  }
}
