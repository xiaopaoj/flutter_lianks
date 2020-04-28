import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterapp/model/user_info.dart';
import 'package:flutterapp/views/main_page.dart';

class AppHomePage extends StatefulWidget {

  final UserInfo userInfo;

  AppHomePage(this.userInfo);

  @override
  State<StatefulWidget> createState() {
    return new _AppHomePage();
  }

}

class _AppHomePage extends State<AppHomePage>
    with SingleTickerProviderStateMixin {

  int _currentIndex = 0;

  List tabData = [
    {
      'text': '直播',
      'color': Colors.white,
      'icon': "icon_zhibo@3x.png"
    },
    {
      'text': '课程',
      'color': Colors.black,
      'icon': "icon_kecheng@3x.png"
    },
    {
      'text': '导师',
      'color': Colors.red,
      'icon': "icon_daoshi@3x.png"
    },
    {
      'text': '我的',
      'color': Colors.yellow,
      'icon': "icon_wode@3x.png"
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
      _list.add(new MainPage(null));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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