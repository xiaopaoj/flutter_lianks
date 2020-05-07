
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  bool showCloseButton = false;

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: new Stack(
        alignment:Alignment.center,
        children: <Widget>[
          new Positioned(
            child: new Text("欢迎来到LIANKS",
              style: new TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 24,
                fontWeight: FontWeight.w600
              ),
            ),
            top: 93,
          ),
          new Positioned(
            top: 158,
            child: new Container(
              width: 295,
              height: 44,
              child: new TextField(
                controller: _controller,
                maxLines: 1,
                scrollPadding: EdgeInsets.only(left: 15),
                style: new TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20, top: 11, bottom: 11),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(31), //边角为31
                    ),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(245, 245, 245, 1),
                      width: 1, //宽度为5
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(31), //边角为31
                      ),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        width: 1, //宽度为5
                      )
                  ),
                ),
                onChanged: (val){
                  if(null != val && "" != val) {
                    setState(() {
                      showCloseButton = true;
                    });
                  } else {
                    setState(() {
                      showCloseButton = false;
                    });
                  }
                },
              ),
            )
          ),

          !showCloseButton ? new Container() :
          new Positioned(
            child: new IconButton(
                iconSize: 16,
                icon: Image.asset("assets/images/icon/default/icon_guanbi@3x.png",
                  width: 16, height: 16,
                  fit: BoxFit.fill,),
                onPressed: (){
                  setState(() {
                    _controller.clear();
                    showCloseButton = false;
                  });
                }
            ),
            top: 158,
            right: 30,
          ),


          new Positioned(
            child: new Text("未注册的手机号验证后自动创建lianks账号",
              style: new TextStyle(
                  color: Color.fromRGBO(155, 155, 155, 1),
                  fontSize: 12,
              ),
            ),
            top: 210,
          ),
          new Positioned(
            child: new MaterialButton(
              minWidth: 295,
              height: 44,
              color: Color.fromRGBO(0, 0, 0, 1),
              child: new Text('下一步',
                style: new TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 14,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
              onPressed: () {},
            ),
            top: 278,
          ),
          new Positioned(
            child: new Text("使用第三方登录",
              style: new TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 12,
              ),
            ),
            top: 455,
          ),

          new Positioned(
            child: new IconButton(
              iconSize: 54,
              icon: Image.asset("assets/images/icon/default/icon_weixin@3x.png",
                fit: BoxFit.fill,),
              onPressed: (){}
            ),
            top: 475,
          ),

          !Platform.isIOS ? new Container() :
          new Positioned(
            child: new Text("or",
              style: new TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 12,
              ),
            ),
            top: 540,
          ),

          !Platform.isIOS ? new Container() :
          new Positioned(
            child: new Container(
              width: 190,
              child: new OutlineButton(
                borderSide:new BorderSide(color: Color.fromRGBO(0, 0, 0, 1)),
                child: new Text('Sign in with Apple',
                  style: new TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                onPressed: () {},
              ),
            ),
            top: 560,
          ),
        ],
      ),
    );
  }

}