import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterapp/application.dart';
import 'package:flutterapp/routes/routes.dart';
import 'package:flutterapp/views/home.dart';
import 'package:flutterapp/widget/loading_widget.dart';
import 'package:fluwx/fluwx.dart';



class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  MyApp(){
    final router = new Router();
    Routes.configureRoutes(router);
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
      return new AppHomePage(null);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Color(0xFFEFEFEF),
        backgroundColor: Color(0xFFEFEFEF),
        primaryColorDark: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
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
        backgroundColor: Colors.white,
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