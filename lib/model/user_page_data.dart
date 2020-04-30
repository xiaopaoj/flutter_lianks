
class UserPageData {
  BaseInfoBean baseInfo;
  List<ClassInfoBean> classInfo;
  List<MarketInfoBean> marketInfo;
  List<SelfInfoBean> selfInfo;

  static UserPageData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserPageData userPageDataBean = UserPageData();
    userPageDataBean.baseInfo = BaseInfoBean.fromMap(map['baseInfo']);
    userPageDataBean.classInfo = List()..addAll(
      (map['classInfo'] as List ?? []).map((o) => ClassInfoBean.fromMap(o))
    );
    userPageDataBean.marketInfo = List()..addAll(
      (map['marketInfo'] as List ?? []).map((o) => MarketInfoBean.fromMap(o))
    );
    userPageDataBean.selfInfo = List()..addAll(
      (map['selfInfo'] as List ?? []).map((o) => SelfInfoBean.fromMap(o))
    );
    return userPageDataBean;
  }

  Map toJson() => {
    "baseInfo": baseInfo,
    "classInfo": classInfo,
    "marketInfo": marketInfo,
    "selfInfo": selfInfo,
  };
}


class SelfInfoBean {
  String desc;
  String icon;
  String tips;
  String title;
  String url;

  static SelfInfoBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SelfInfoBean selfInfoBean = SelfInfoBean();
    selfInfoBean.desc = map['desc'];
    selfInfoBean.icon = map['icon'];
    selfInfoBean.tips = map['tips'];
    selfInfoBean.title = map['title'];
    selfInfoBean.url = map['url'];
    return selfInfoBean;
  }

  Map toJson() => {
    "desc": desc,
    "icon": icon,
    "tips": tips,
    "title": title,
    "url": url,
  };
}

class MarketInfoBean {
  String desc;
  String icon;
  String tips;
  String title;
  String url;

  static MarketInfoBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MarketInfoBean marketInfoBean = MarketInfoBean();
    marketInfoBean.desc = map['desc'];
    marketInfoBean.icon = map['icon'];
    marketInfoBean.tips = map['tips'];
    marketInfoBean.title = map['title'];
    marketInfoBean.url = map['url'];
    return marketInfoBean;
  }

  Map toJson() => {
    "desc": desc,
    "icon": icon,
    "tips": tips,
    "title": title,
    "url": url,
  };
}


class ClassInfoBean {
  String desc;
  String icon;
  String tips;
  String title;
  String url;

  static ClassInfoBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ClassInfoBean classInfoBean = ClassInfoBean();
    classInfoBean.desc = map['desc'];
    classInfoBean.icon = map['icon'];
    classInfoBean.tips = map['tips'];
    classInfoBean.title = map['title'];
    classInfoBean.url = map['url'];
    return classInfoBean;
  }

  Map toJson() => {
    "desc": desc,
    "icon": icon,
    "tips": tips,
    "title": title,
    "url": url,
  };
}

class BaseInfoBean {
  int isAuth;
  String nickName;
  int userGrade;
  String userGradeIcon;
  String userId;
  String userPicture;

  static BaseInfoBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BaseInfoBean baseInfoBean = BaseInfoBean();
    baseInfoBean.isAuth = map['isAuth'];
    baseInfoBean.nickName = map['nickName'];
    baseInfoBean.userGrade = map['userGrade'];
    baseInfoBean.userGradeIcon = map['userGradeIcon'];
    baseInfoBean.userId = map['userId'];
    baseInfoBean.userPicture = map['userPicture'];
    return baseInfoBean;
  }

  Map toJson() => {
    "isAuth": isAuth,
    "nickName": nickName,
    "userGrade": userGrade,
    "userGradeIcon": userGradeIcon,
    "userId": userId,
    "userPicture": userPicture,
  };
}