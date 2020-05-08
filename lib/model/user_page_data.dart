
class UserPageData {
  BaseInfoBean baseInfo;
  List<ButtonBean> classInfo;
  List<ButtonBean> marketInfo;
  List<ButtonBean> selfInfo;

  static UserPageData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserPageData userPageDataBean = UserPageData();
    userPageDataBean.baseInfo = BaseInfoBean.fromMap(map['baseInfo']);
    userPageDataBean.classInfo = List()..addAll(
      (map['classInfo'] as List ?? []).map((o) => ButtonBean.fromMap(o))
    );
    userPageDataBean.marketInfo = List()..addAll(
      (map['marketInfo'] as List ?? []).map((o) => ButtonBean.fromMap(o))
    );
    userPageDataBean.selfInfo = List()..addAll(
      (map['selfInfo'] as List ?? []).map((o) => ButtonBean.fromMap(o))
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


class ButtonBean {
  String desc;
  String icon;
  String tips;
  String title;
  String url;

  static ButtonBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ButtonBean buttonBean = ButtonBean();
    buttonBean.desc = map['desc'];
    buttonBean.icon = map['icon'];
    buttonBean.tips = map['tips'];
    buttonBean.title = map['title'];
    buttonBean.url = map['url'];
    return buttonBean;
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