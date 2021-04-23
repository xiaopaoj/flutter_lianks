import 'package:event_bus/event_bus.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_lianks/application.dart';
import 'package:flutter_lianks/model/user_info.dart';
import 'package:flutter_lianks/routes/routes.dart';
import 'package:flutter_lianks/views/home.dart';
import 'package:fluwx/fluwx.dart';

import 'event/event_model.dart';



class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  MyApp(){
    final router = new FluroRouter();
    AppRoutes.configureRoutes(router);
    // 这里设置项目环境
    Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _MyAppState(){
    final eventBus = new EventBus();
    Application.eventBus = eventBus;
  }

  @override
  void initState() {
    super.initState();
    _initFluwx();


    weChatResponseEventHandler.listen((res) {
      if (res is WeChatPaymentResponse) {


      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initFluwx() async {
    await registerWxApi(
      appId: "wxef1bca1fa60dd05c",
      doOnAndroid: true,
      doOnIOS: true);
    var result = await isWeChatInstalled;
    print("is installed $result");
  }
  
  bool _isReloading = false;

  Widget showWelcomeWidget(){
    if(_isReloading) {
      return new Container(
        color: Colors.white,
        child: Center(
          child: SpinKitPouringHourglass(color: Colors.black),
        ),
      );
    } else {
      return new AppHomePage();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(255, 255, 255, 1),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        primaryColorDark: Color.fromRGBO(255, 255, 255, 1),
        accentColor: Color.fromRGBO(255, 255, 255, 1),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF000000),
          size: 35.0,
        ),
      ),

      home: new Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: showWelcomeWidget(),),
//      onGenerateRoute: Application.router.generator,
    );
  }

}

void main() {
  runApp(MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor:Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}