import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/event/event_model.dart';
import 'package:flutterapp/model/user_info.dart';
import 'package:flutterapp/routes/routes.dart';
import 'package:flutterapp/utils/local_storage_utils.dart';
import 'package:flutterapp/views/live/live_main_page.dart';
import 'package:flutterapp/views/product/product_main_page.dart';
import 'package:flutterapp/views/teacher/teacher_main_page.dart';
import 'package:flutterapp/views/user/user_main_page.dart';

import '../application.dart';

class AppHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _AppHomePage();
  }

}

class _AppHomePage extends State<AppHomePage>
    with SingleTickerProviderStateMixin {

  UserInfo _userInfo;

  int _currentIndex = 0;

  List tabData = [
    {
      'text': '直播',
      'color': Colors.white,
      'icon': "icon_zhibo@3x.png",
    },
    {
      'text': '课程',
      'color': Colors.black,
      'icon': "icon_kecheng@3x.png",
    },
    {
      'text': '导师',
      'color': Colors.red,
      'icon': "icon_daoshi@3x.png",
    },
    {
      'text': '我的',
      'color': Colors.yellow,
      'icon': "icon_wode@3x.png",
    },
  ];

  List<BottomNavigationBarItem> _myTabs = [];

  List<Widget> _list = [];

  @override
  void initState() {
    super.initState();

    tabData.forEach((r) {
      _myTabs.add(new BottomNavigationBarItem(
          title: new Container(),
          icon: myIcon(18.0, "assets/images/icon/default/" + r['icon'],),
          activeIcon: myIcon(22.0, "assets/images/icon/click/" + r['icon'],)
      ));
      _list.add(new Container());
    });

    LocalStorageUtils.getUserInfo().then((r) {
      if(null != r) {
        if(mounted) {
          _userInfo = r;
        }
      }
    });

    setState(() {
      if(mounted) {
        _itemTapped(0);
      }
    });

    Application.eventBus.on<NoLoginEvent>().listen((event) {
      print('接收到的 event 没有登录');
      Application.router.navigateTo(context, '${Routes.login}',
        transition: TransitionType.nativeModal,
      );
    });

    Application.eventBus.on<LoginEvent>().listen((event) {
      print('接收到的 event 登录成功');
      setState(() {
        LocalStorageUtils.getUserInfo().then((r) {
          _userInfo = r;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: new IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        currentIndex: _currentIndex,
        onTap: _itemTapped,
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme
            .of(context)
            .primaryColor,
      ),
    );
  }

  void _itemTapped(int index) {
    setState(() {

      switch(index){
        case 0 :
          if(_list[index] is Container){
            _list[index] = new LiveMainPage(_userInfo);
          }
          break;
        case 1 :
          if(_list[index] is Container){
            _list[index] = new ProductMainPage(_userInfo);
          }
          break;
        case 2 :
          if(_list[index] is Container){
            _list[index] = new TeacherMainPage(_userInfo);
          }
          break;
        case 3 :
          if(_list[index] is Container){
            UserMainPage u = new UserMainPage();
            _list[index] = u;
          } else {
            UserMainPage u = _list[index];
          }
          break;
        default :
          _list[index] = new Container();
      }
      _currentIndex = index;
    });
  }

  static Widget myIcon(size, image) {
    return Image.asset(
      image,
      width: size,
      height: size,
    );
  }
}