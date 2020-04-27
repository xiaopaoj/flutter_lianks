import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/model/live_class.dart';
import 'package:flutterapp/model/live_top.dart';
import 'package:flutterapp/model/page.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/views/first_page/live/live_top_page.dart';

class LivePackPage extends StatefulWidget {
  @override
  State<LivePackPage> createState() => new _LivePackPage();
}

class _LivePackPage extends State<LivePackPage> {

  List<BannerListBean> _bannerList;

  LivingBean _living;

  Page _page;

  List<dynamic> _list;

  @override
  void initState() {
    super.initState();

    DataUtils.getLiveTop().then((r) {
      setState(() {
        _bannerList = r.bannerList;
        _living = r.living;
      });
    });

    DataUtils.getLiveList(1, 10, 0, 0).then((r) {
      setState(() {
        _page = r;
        _list = _page.dataList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      color: Color.fromRGBO(244, 245, 247, 1),
      child: new CustomScrollView(
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
                child: new LivingClass(LiveClass.fromLivingBean(_living)),
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
                  child: new Text("系列课列表",
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
                return new LivingClass(LiveClass.fromLiveListApi(_list[index]));
              },
              childCount: _list.length,
            ),
          ) : new SliverToBoxAdapter(),

        ],
      ),

//      new ListView(
//        children: <Widget>[
//          _bannerView(),
//          null != _living ? new Container(
//            height: 24,
//            margin: EdgeInsets.only(top: 4),
//            child: new LivingLabel(),
//          ) : new Container(),
//          null != _living ? new Container(
//            height: 90,
//            child: new LivingClass(LiveClass.fromLivingBean(_living))
//          ) : new Container(),
//          new Container(
//            margin: EdgeInsets.only(top: 12),
//            color: Color.fromRGBO(255, 255, 255, 1),
//            child: new Container(
//              width: 90,
//              height: 25,
//              margin: EdgeInsets.only(top: 16, bottom: 13, left: 12),
//              child: new Text("系列课列表",
//                style: new TextStyle(
//                  fontSize: 18,
//                  color: Color.fromRGBO(0, 0, 0, 1),
//                  //字体粗细  粗体和正常
//                  fontWeight: FontWeight.w400,
//                ),
//              ),
//            )
//          ),
//          new Container(
//            height: 85,
//            child: new Container(
//              child: new Row(
//                children: <Widget>[
//
//                ],
//              ),
//            ),
//          ),
//          new Container(child: new Text("5"),),
//          new Container(child: new Text("5"),),
//          new Container(child: new Text("5"),),
//          new Container(child: new Text("5"),),
//        ],
//      ),
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
  }
}
