
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/event/event_model.dart';
import 'package:flutterapp/utils/data_utils.dart';
import 'package:flutterapp/utils/reg_utils.dart';
import 'package:flutterapp/utils/toast_utils.dart';

import '../../application.dart';
import '../home.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  bool showCloseButton = false;

  TextEditingController _controller;

  TextEditingController _validCodeController;

  String _phone = "";

  String _validCode = "";

  int _index = 0;

  Timer _countdownTimer;

  String _codeCountdownStr = '获取验证码';

  int _countdownNum = 59;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
    _validCodeController = new TextEditingController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _validCodeController?.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch(_index) {
      case 1:
        return _validCodeWidget();
      default :
        return _phoneWidget();
    }
  }

  Widget _validCodeWidget() {
    return new Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      body: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Positioned(
              child: new Text("输入验证码",
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
                    controller: _validCodeController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,//只输入数字
                      LengthLimitingTextInputFormatter(6)//限制长度
                    ],
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
                  ),
                )
            ),

            new Positioned(
                top: 209,
                left: 40,
                child: new Text("手机号：$_phone",
                  style: new TextStyle(
                      color: Color.fromRGBO(155, 155, 155, 1),
                      fontSize: 12,
                  ),
                )
            ),

            new Positioned(
                top: 209,
                right: 40,
                child: new GestureDetector(
                  onTap: (){
                    if (_countdownTimer != null) {
                      return;
                    } else {
                      DataUtils.getValidCode(_phone).then((r) {
                        if(r) {
                          reGetCountdown();
                        }
                      });
                    }
                  },
                  child: new Text("$_codeCountdownStr",
                    style: new TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 12,
                    ),
                  )
                )
            ),

            new Positioned(
              child: new MaterialButton(
                minWidth: 295,
                height: 44,
                color: Color.fromRGBO(0, 0, 0, 1),
                child: new Text('登录',
                  style: new TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 14,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
                onPressed: () {
                  if(null == _validCodeController.text
                      || "" == _validCodeController.text) {
                    ToastUtils.showMessage("请输入验证码");
                    return;
                  }
                  _validCode = _validCodeController.text;
                  DataUtils.loginV2({
                    "loginType" : 3,
                    "phone" : _phone,
                    "platform" : Platform.isIOS ? 1 : 2,
                    "validCode" : _validCode,
                  }).then((r) {
                    if(r) {
                      _validCodeController.clear();
                      Application.eventBus.fire(LoginEvent());
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => AppHomePage()),
                              (route) => route == null);
                    }
                  });
                },
              ),
              top: 278,
            ),
          ]),
    );
  }

  void reGetCountdown() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _codeCountdownStr = '${_countdownNum--}后重新获取';
      _countdownTimer =
      new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownNum > 0) {
            _codeCountdownStr = '${_countdownNum--}后重新获取';
          } else {
            _codeCountdownStr = '获取验证码';
            _countdownNum = 59;
            _countdownTimer.cancel();
            _countdownTimer = null;
          }
        });
      });
    });
  }

  Widget _phoneWidget(){
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
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,//只输入数字
                    LengthLimitingTextInputFormatter(11)//限制长度
                  ],
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
              onPressed: () {
                if(!RegUtils.isChinaPhoneLegal(_controller.text)) {
                  ToastUtils.showMessage("手机号错误");
                } else {
                  setState(() {
                    if(mounted) {
                      _phone = _controller.text;
                      _validCodeController.clear();

                      DataUtils.getValidCode(_phone).then((r) {
                        if(r) {
                          _index = 1;
                          reGetCountdown();
                        }
                      });
                    }
                  });
                }
              },
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
