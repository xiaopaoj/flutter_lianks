
import 'package:flutterapp/api.dart';
import 'package:flutterapp/model/live_top.dart';
import 'package:flutterapp/model/page.dart';
import 'package:flutterapp/utils/net_utils.dart';

class DataUtils {

  static Future<LiveTopModel> getLiveTop() async {
    var response = await NetUtils.get(Api.LIVE_TOP);
    try {
      LiveTopModel liveTopModel = LiveTopModel.fromMap(response['data']);
      return liveTopModel;
    } catch (err) {
      return response['message'];
    }
  }

  static Future<Page> getLiveList(int pageNum, int pageSize, int liveType,
      int isPast) async {
    var response = await NetUtils.get(Api.LIVE_LIST, {
      "pageNum" : pageNum,
      "pageSize" : pageSize,
      "liveType" : liveType,
      "isPast" : isPast,
    });
    try {
      Page page = Page.fromMap(response['data']);
      return page;
    } catch (err) {
      return response['message'];
    }
  }
}