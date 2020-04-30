

import 'dart:convert';

import 'package:flutterapp/model/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();

class LocalStorageUtils {

  static UserInfo getUserInfo(){
    UserInfo userInfo = prefs.then((r) {
      String jsonStr = r.getString("LOCAL_STORAGE_USER_INFO") ?? "";
      if(jsonStr == null) {
        return new UserInfo();
      }
      return UserInfo.fromMap(jsonDecode(jsonStr));
    }) as UserInfo;
    return userInfo;
  }

  static String getToken(){
    return prefs.then((r) {
      String jsonStr = r.getString("LOCAL_STORAGE_TOKEN") ?? "";
      return jsonStr;
    }) as String;
  }

}