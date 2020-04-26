/// firstLogin : 0
/// headPicture : "string"
/// loginUserId : "string"
/// nickName : "string"
/// token : "string"
/// userSig : "string"

class UserInfo {
  int firstLogin;
  String headPicture;
  String loginUserId;
  String nickName;
  String token;
  String userSig;

  static UserInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserInfo userInfoBean = UserInfo();
    userInfoBean.firstLogin = map['firstLogin'];
    userInfoBean.headPicture = map['headPicture'];
    userInfoBean.loginUserId = map['loginUserId'];
    userInfoBean.nickName = map['nickName'];
    userInfoBean.token = map['token'];
    userInfoBean.userSig = map['userSig'];
    return userInfoBean;
  }

  Map toJson() => {
    "firstLogin": firstLogin,
    "headPicture": headPicture,
    "loginUserId": loginUserId,
    "nickName": nickName,
    "token": token,
    "userSig": userSig,
  };
}