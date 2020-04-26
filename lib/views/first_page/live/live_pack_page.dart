import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/views/first_page/live/live_top_page.dart';

class LivePackPage extends StatefulWidget {
  @override
  State<LivePackPage> createState() => new _LivePackPage();
}

class _LivePackPage extends State<LivePackPage> {
  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      color: Color.fromRGBO(244, 245, 247, 1),
      child: new ListView(
        children: <Widget>[
          new Container(
            child: new Container(
              child: new Swiper(
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: 212,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    "https://lianks-picture-uat.oss-cn-beijing.aliyuncs.com/lianks-images/20200420/de2c7d11-0898-4e88-bd2c-28b25524e862.png",
                    fit: BoxFit.fitHeight,
                  );
                },
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
              ),
              height: 212,
            ),
          ),
          new Container(
            height: 24,
            margin: EdgeInsets.only(top: 4),
            child: new LivingLabel(),
          ),
          new Container(
            height: 90,
            child: new LivingClass()),
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
        ],
      ),
      onRefresh: _handleRefresh,
    );
  }

  Future<Null> _handleRefresh() async {
  }
}
