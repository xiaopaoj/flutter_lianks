
import 'dart:core';

import 'package:flutterapp/model/live_top.dart';

class LiveClass {

  String showImage;
  String teacherName;
  String tagName;
  String firstLabel;
  String secondLabel;
  String thirdLabel;
  String originalPrice;
  String standardPrice;
  String detailUrl;

  static LiveClass fromLivingBean(LivingBean livingBean){
    if (livingBean == null) return null;
    LiveClass liveClass = LiveClass();
    liveClass.showImage = livingBean.listImage;
    liveClass.teacherName = livingBean.teacherName;
    liveClass.tagName = livingBean.tagName;
    liveClass.firstLabel = livingBean.productName;
    liveClass.secondLabel = livingBean.packName;
    liveClass.thirdLabel = livingBean.dateTimeStr + "   " + livingBean.payCount.toString() +  "人报名";
    liveClass.originalPrice = livingBean.originalPrice;
    liveClass.standardPrice = livingBean.standardPrice;
    liveClass.detailUrl = livingBean.detailUrl;
    return liveClass;
  }

  static LiveClass fromLiveListApi(dynamic map){
    if (map == null) return null;
    LiveClass liveClass = LiveClass();
    liveClass.showImage = map['listImage'];
    liveClass.teacherName = map['teacherName'];
    liveClass.tagName = map['tagName'];
    liveClass.firstLabel = map['productName'];
    if(int.parse(map['isPack']) == 0) {
      liveClass.secondLabel = map['packName'];
    } else {
      liveClass.secondLabel = map['updatedCount'] + "  " + map['planCount'];
    }

    liveClass.thirdLabel = map['dateTimeStr'] + "   " + map['livingBean.payCount'] +  "人报名";
    liveClass.originalPrice = map['originalPrice'];
    liveClass.standardPrice = map['standardPrice'];
    liveClass.detailUrl = map['livingBean.detailUrl'];
    return liveClass;
  }

}