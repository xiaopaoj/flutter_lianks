import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/user_info.dart';
import 'package:flutterapp/model/user_page_data.dart';
import 'package:flutterapp/routes/routes.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/utils/toast_utils.dart';
import 'package:flutterapp/views/live/live_list_page.dart';
import 'package:flutterapp/views/product/product_list_page.dart';
import 'package:flutterapp/views/teacher/teacher_list_page.dart';

import '../../application.dart';

class UserMainPage extends StatefulWidget {

  @override
  State<UserMainPage> createState() => _UserMainPage();
}

class _UserMainPage extends State<UserMainPage>
    with SingleTickerProviderStateMixin {

  UserPageData _userPageData;


  List<Widget> mTabView = []; //使用widget的形式

  @override
  void initState() {
    super.initState();
    DataUtils.getMyIndexInfo().then((r) {
      setState(() {
        if(mounted) {
          _userPageData = r;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _userPageData == null ?
    new Container() :
    new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: new AppBar(
        centerTitle: true,
        elevation: 0,
        title: new Text("个人中心",
          style: new TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      body: new CustomScrollView(
          physics: new AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[

            new SliverToBoxAdapter(
              child: new Container(
                child:new Container(
                  width: double.infinity,
                  height: 88,
                  padding: EdgeInsets.only(top: 12),
                  child: new Stack(
                    children: <Widget>[
                      new Positioned(
                        left: 12,
                        bottom: 12,
                        child: new Container(
                          width: 64,
                          height: 64,
                          child: new CircleAvatar(
                            backgroundImage: NetworkImage(
                                _userPageData.baseInfo.userPicture,
                                scale: 64
                            ),
                            radius: 64,
                          ),
                        ),),
                      new Positioned(
                          top: 11,
                          left: 110,
                          child: new Text(_userPageData.baseInfo.nickName,
                            style: new TextStyle(
                                fontSize: 22,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontWeight: FontWeight.w600
                            ),
                          )
                      ),

                      new Positioned(
                          top: 41,
                          left: 110,
                          child: new Text("ID:  ${_userPageData.baseInfo.userId}",
                            style: new TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(155, 155, 155, 1),
                                fontWeight: FontWeight.w600
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),


            new SliverToBoxAdapter(
              child: new Container(
                width: double.infinity,
                height: 12,
                color: Color.fromRGBO(244, 245, 247, 1),
              ),
            ),

            new SliverToBoxAdapter(
              child:  new Container(
                width: double.infinity,
                height: 39,
                color: Theme.of(context).backgroundColor,
                margin: EdgeInsets.only(top: 12,),
                child: new Container(
                  margin: EdgeInsets.only(top: 11, left: 30),
                  child: new Text("我的课程权益",
                    style: new TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            ),



            new SliverToBoxAdapter(
              child:  new Container(
                width: 351,
                height: 2,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 13, right: 13),
                decoration: new BoxDecoration(
                  border: new Border(bottom: BorderSide(
                      color: Color.fromRGBO(232, 232, 232, 1),
                      width: 0.5
                  )),
                ),
              ),
            ),

            new SliverToBoxAdapter(
              child: new Container(
                child: new Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 19, left: 30, right: 30),
                    height: 214,
                    child: GridView.builder(
                        itemCount: _userPageData.classInfo.length,
                        physics: new NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //横轴元素个数
                          crossAxisCount: 3,
                          //纵轴间距
                          mainAxisSpacing: 0.0,
                          //横轴间距
                          crossAxisSpacing: 0.0,
                          //子组件宽高长度比例
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          //Widget Function(BuildContext context, int index)
                          return _getClassItem(_userPageData.classInfo[index]);
                        }
                    )
                ),
              ),
            ),

            new SliverToBoxAdapter(
              child: new Container(
                width: 351,
                height: 2,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 13, right: 13),
                decoration: new BoxDecoration(
                  border: new Border(bottom: BorderSide(
                      color: Color.fromRGBO(232, 232, 232, 1),
                      width: 0.5
                  )),

                ),
              ),
            ),


            new SliverToBoxAdapter(
              child: new Container(
                child: new Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 19, left: 30, right: 30),
                    height: 147,
                    child: GridView.builder(
                        itemCount: _userPageData.selfInfo.length,
                        physics: new NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //横轴元素个数
                          crossAxisCount: 3,
                          //纵轴间距
                          mainAxisSpacing: 0.0,
                          //横轴间距
                          crossAxisSpacing: 14.0,
                          //子组件宽高长度比例
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          //Widget Function(BuildContext context, int index)
                          return _getSelfInfoItem(_userPageData.selfInfo[index]);
                        }
                    )
                ),
              ),
            ),

            new SliverToBoxAdapter(
              child: new Container(
                width: double.infinity,
                height: 12,
                color: Color.fromRGBO(244, 245, 247, 1),
              ),
            ),


            new SliverToBoxAdapter(
              child:  new Container(
                width: double.infinity,
                height: 39,
                color: Theme.of(context).backgroundColor,
                margin: EdgeInsets.only(top: 12,),
                child: new Container(
                  margin: EdgeInsets.only(top: 11, left: 30),
                  child: new Text("市场合作",
                    style: new TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            ),

            new SliverToBoxAdapter(
              child:  new Container(
                width: 351,
                height: 2,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 13, right: 13),
                decoration: new BoxDecoration(
                  border: new Border(bottom: BorderSide(
                      color: Color.fromRGBO(232, 232, 232, 1),
                      width: 0.5
                  )),
                ),
              ),
            ),

            new SliverToBoxAdapter(
              child: new Container(
                child: new Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 19, left: 30, right: 30),
                    height: 50,
                    child: GridView.builder(
                        itemCount: _userPageData.marketInfo.length,
                        physics: new NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //横轴元素个数
                          crossAxisCount: 3,
                          //纵轴间距
                          mainAxisSpacing: 0.0,
                          //横轴间距
                          crossAxisSpacing: 14.0,
                          //子组件宽高长度比例
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          //Widget Function(BuildContext context, int index)
                          return _getMarketItem(_userPageData.marketInfo[index]);
                        }
                    )
                ),
              ),
            ),

          ],
      ),
    );
  }

  Widget _getMarketItem(ButtonBean marketInfoBean) {
    return new GestureDetector(
      onTap: (){
        _clickButton(marketInfoBean);
      },
      child: new Container(
        width: 60,
        height: 75,
        child: new Text(marketInfoBean.title,
          style: new TextStyle(
            color: Color.fromRGBO(121, 121, 121, 1),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _getClassItem(ButtonBean classInfoBean){
    return new GestureDetector(
      onTap: (){
        _clickButton(classInfoBean);
      },
      child: new Container(
        width: 60,
        height: 75,
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Positioned(
                top: 0,
                child: new Container(
                  width: 39, height: 39,
                  child: Image.network(classInfoBean.icon),
                )
            ),

            new Positioned(
                top: 40,
                child: new Container(
                  child: new Text(classInfoBean.title,
                    style: new TextStyle(
                      color: Color.fromRGBO(96, 96, 96, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
            ),

            new Positioned(
                top: 55,
                child: new Container(
                  child: new Text(classInfoBean.tips,
                    style: new TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                      fontSize: 9,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }


  Widget _getSelfInfoItem(ButtonBean selfInfoBean) {
    return new GestureDetector(
      onTap: () {
        _clickButton(selfInfoBean);
      },
      child:
      new Container(
        width: 45,
        height: 45,
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Positioned(
                top: 5,
                child: new Container(
                  width: 24, height: 24,
                  child: Image.network(selfInfoBean.icon),
                )
            ),

            new Positioned(
                top: 30,
                child: new Container(
                  child: new Text(selfInfoBean.title,
                    style: new TextStyle(
                      color: Color.fromRGBO(121, 121, 121, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
            ),

          ],
        ),
      )
    );
  }

  void _clickButton(ButtonBean bean){
    String url = bean.url;
    if( null == url || "" == url) {
      return;
    }
    if(url.contains("LIANKS_WH://OpenWebView/URL=")) {
      // 跳转web
      url = url.replaceAll("LIANKS_WH://OpenWebView/URL=", "");

      Application.router.navigateTo(context,
        '${Routes.webDetail}?url=${Uri.encodeComponent(url)}&title=${Uri.encodeComponent(bean.title)}',
        transition: TransitionType.nativeModal,
      );
    } else if(url.contains("LIANKS_NH://")) {
      url = url.replaceAll("LIANKS_NH://", "");

      switch (url) {
        case "OpenMyTeacherClass":
        //教师培训
          Application.router.navigateTo(context,
            '${Routes.myProduct}?title=${Uri.encodeComponent(
                bean.title)}&type=2',
            transition: TransitionType.nativeModal,
          );
          break;
        case "OpenMyWorkShopClass":
        //工作坊
          Application.router.navigateTo(context,
            '${Routes.myProduct}?title=${Uri.encodeComponent(
                bean.title)}&type=1',
            transition: TransitionType.nativeModal,
          );
          break;
        case "OpenMyMiniClass":
        //小班课
          Application.router.navigateTo(context,
            '${Routes.myProduct}?title=${Uri.encodeComponent(
                bean.title)}&type=4',
            transition: TransitionType.nativeModal,
          );
          break;
        case "OpenMyMeetingClass":
        //瑜伽大会
          Application.router.navigateTo(context,
            '${Routes.myProduct}?title=${Uri.encodeComponent(
                bean.title)}&type=5',
            transition: TransitionType.nativeModal,
          );
          break;
        case "OpenMyFavoritesClass":
        //收藏
          Application.router.navigateTo(context,
            '${Routes.myCollectionProduct}',
            transition: TransitionType.nativeModal,
          );
          break;
        case "OpenMyFavoritesTeacher":
        //收藏
          Application.router.navigateTo(context,
            '${Routes.myCollectionTeacher}',
            transition: TransitionType.nativeModal,
          );
          break;
        case "OpenMyOrderList":
        //订单
          Application.router.navigateTo(context,
            '${Routes.myOrder}',
            transition: TransitionType.nativeModal,
          );
          break;
        default :
        // 跳转原生
          ToastUtils.showMessage("跳转$url");
          return;
      }

    }
  }
}
