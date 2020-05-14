
import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveVideoPage extends StatefulWidget {

  final String url;

  LiveVideoPage(this.url);

  @override
  State<LiveVideoPage> createState() =>new _LiveVideoPage();
}

class _LiveVideoPage extends State<LiveVideoPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(
      body: new Container(
        width: size.width,
        height: size.height,
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Container(
              width: size.width,
              height: size.height,
              child: AwsomeVideoPlayer(
                widget.url,
//          playOptions: new VideoPlayOptions(
//            loop: false,
                videoStyle: new VideoStyle(
                  showPlayIcon: false,
                  videoTopBarStyle: new VideoTopBarStyle(
                      show: false
                  ),
                  videoControlBarStyle: new VideoControlBarStyle(
                    height: 46,
                    barBackgroundColor: Color.fromRGBO(255, 255, 255, 0),
                    timeFontSize: 12,
                    timeFontColor: Color.fromRGBO(86, 73, 48, 1),
                    progressStyle: new VideoProgressStyle(
                      height: 2,
                      playedColor: Color.fromRGBO(245, 166, 35, 1),
                      dragHeight: 10,
                      dragBarColor: Color.fromRGBO(245, 166, 35, 1),
                    ),
                    playIcon: new Container(
                      width: 38, height: 38,
                      child: Image.asset(
                        "assets/images/icon/default/icon_kaishi@3x.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    pauseIcon: new Container(
                      width: 38, height: 38,
                      child: Image.asset(
                        "assets/images/icon/default/icon_zanting@3x.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    itemList: [
                      "play",
                      "position-time", //当前播放时间
                      "progress", //线形进度条
                      "duration-time", //视频总时长
                      "fullscreen"
                    ],
                  ),

                  /// 自定义字幕
                  videoSubtitlesStyle: VideoSubtitles(
                    mianTitle: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                        child: Text(
                            "主字幕",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ),
                    ),
                    subTitle: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            "副字幕",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ),
                    ),
                  ),
                ),
                children: <Widget>[
                  new Text("abcd"),
                  new Text("124"),
                  new Text("abcd"),
                  new Text("abcdvvvvvvvvvvvvvvvvvvv"),
                ],
                /// 视频初始化完成回调
                oninit: (controller) {
                  print("video oninit");
                },
                /// 视频播放回调
                onplay: (value) {
                  print("video played");
                },
                /// 视频暂停回调
                onpause: (value) {
                  print("video paused");
                },
                /// 视频播放结束回调
                onended: (value) {
                  print("video ended");
                },
                /// 视频播放进度回调
                /// 可以用来匹配字幕
                ontimeupdate: (value) {
//                  print("timeupdate $value");
//                  var position = value.position.inMilliseconds / 1000;
                  //根据 position 来判断当前显示的字幕
                },
                /// 声音变化回调
                onvolume: (value) {
                  print("onvolume $value");
                },
                /// 亮度变化回调
                onbrightness: (value) {
                  print("onbrightness $value");
                },
                /// 网络变化回调
                onnetwork: (value) {
                  print("onbrightness $value");
                },
                /// 顶部控制栏点击返回按钮
                onpop: (value) {
                  print("返回上一页");
                },
//          ),
              ),
            ),
            new Positioned(
              top: 14,
              left: 0,
              child: new Container(
                child: new IconButton(
                  icon: Image.asset("assets/images/icon/default/icon_fanhui@3x.png",
                    width: 15, height: 15,
                    fit: BoxFit.fill,),
                  onPressed: (){
                    Navigator.pop(context);
                  }
                )
              ),
            ),

            new Positioned(
              top: 30,
              child: new Container(
                width: 78, height: 12,
                child: Image.asset("assets/images/icon/default/logo@3x.png", width: 78, height: 12,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}