import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/user_info.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/views/live/live_list_page.dart';
import 'package:flutterapp/views/product/product_list_page.dart';
import 'package:flutterapp/views/teacher/teacher_list_page.dart';

import '../../application.dart';

class UserMainPage extends StatefulWidget {
  final UserInfo userInfo;

  UserMainPage(this.userInfo);

  @override
  State<UserMainPage> createState() => _UserMainPage(this.userInfo);
}

class _UserMainPage extends State<UserMainPage>
    with SingleTickerProviderStateMixin {
  UserInfo userInfo;

  _UserMainPage(this.userInfo);



  List<Widget> mTabView = []; //使用widget的形式

  @override
  void initState() {
    super.initState();
    DataUtils.getMyIndexInfo().then((tags) {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
