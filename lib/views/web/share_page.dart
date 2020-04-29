import 'package:flutter/material.dart';
import 'package:flutterapp/utils/toast_utils.dart';
import 'package:fluwx/fluwx.dart';

List<ShareMenu> menuList = [];



void share(BuildContext context, dynamic content) {

  menuList
    ..add(new ShareMenu("assets/images/icon/default/wx.png", "微信好友", wxShareSession))
    ..add(new ShareMenu("assets/images/icon/default/wx.png", "微信朋友圈", wxShareSession))
    ..add(new ShareMenu("assets/images/icon/default/wx.png", "QQ好友", wxShareSession))
    ..add(new ShareMenu("assets/images/icon/default/wx.png", "QQ空间", wxShareSession));


  showModalBottomSheet(builder: (BuildContext context) {
    return new Container(
      height: 100,
      color: Colors.white,
      child: new Container(
        child: new GridView.builder(
          padding: EdgeInsets.only(left: 10, top: 0, bottom: 10, right: 10),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5.0,
              childAspectRatio: 1.0
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: GestureDetector(
                onTap: () {
                  menuList[index].click(content);
                },
                child: new Stack(
                  alignment:Alignment.center ,
                  children: <Widget>[
                    new Positioned(
                      child: Image.asset(menuList[index].imageAsset, width: 50, height: 50,),
//                        left: 15,
//                        top: 15,
                    ),
                    new Positioned(
                      child: new Container(
                        child: new Text(
                          menuList[index].title,
                          textAlign: TextAlign.right,
                          style: new TextStyle(
                              fontSize: 12
                          ),
                        ),
                      ),
                      bottom: 2,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: menuList.length,
        ),
      ),
    );
  }, context: context);
}

void wxShareSession(content){
  if(content is List && content.length >= 4) {
    shareToWeChat(WeChatShareWebPageModel(
      content[0].toString(),
      title : content[1].toString(),
      mediaTagName: content[2].toString(),
      thumbnail: WeChatImage.network(content[3].toString()),
      scene: WeChatScene.SESSION,
    ));
  } else {
    ToastUtils.showMessage("分享失败");
  }
}


class ShareMenu {

  final String imageAsset;

  final String title;

  final Function click;

  ShareMenu(this.imageAsset, this.title, this.click);

}