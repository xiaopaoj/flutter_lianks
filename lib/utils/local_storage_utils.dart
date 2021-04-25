

import 'dart:convert';

import 'package:flutter_lianks/model/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();

class LocalStorageUtils {

  static void saveUser(UserInfo userInfo){
    prefs.then((r) {
      r.setString("LOCAL_STORAGE_USER_INFO", jsonEncode(userInfo.toJson()));
      r.setString("LOCAL_STORAGE_TOKEN", userInfo.token);
    });
  }

  static Future<UserInfo> getUserInfo(){
    return prefs.then((r) {
      String jsonStr = r.getString("LOCAL_STORAGE_USER_INFO") ?? "";
      if(jsonStr == null) {
        return new UserInfo();
      }
      print("onvolume $jsonStr");
      return UserInfo.fromMap(jsonDecode(jsonStr));
    });
  }

  static Future<String> getToken(){
    return prefs.then((r) {
      String jsonStr = r.getString("LOCAL_STORAGE_TOKEN") ?? "";
      return jsonStr;
    });
  }

}