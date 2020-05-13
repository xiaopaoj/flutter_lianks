
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
                  height: 50,
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
                    child: Image.asset("assets/images/icon/default/icon_kaishi@3x.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  pauseIcon: new Container(
                    width: 38, height: 38,
                    child: Image.asset("assets/images/icon/default/icon_zanting@3x.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  itemList: [
                    "play",
                    "position-time", //当前播放时间
                    "progress",//线形进度条
                    "duration-time", //视频总时长
                    "fullscreen"
                  ],
                )
              ),
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