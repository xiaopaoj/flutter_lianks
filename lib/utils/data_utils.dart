
import 'package:flutterapp/api.dart';
import 'package:flutterapp/model/dict.dart';
import 'package:flutterapp/model/live_top.dart';
import 'package:flutterapp/model/page.dart';
import 'package:flutterapp/model/product.dart';
import 'package:flutterapp/utils/net_utils.dart';

class DataUtils {

  static String token = "eyJhbGciOiJIUzI1NiJ9.eyJyZWFsTmFtZSI6IiIsIm5pY2tOYW1lIjoi5aSp5aSW6aOe5LuZIiwiZ2VuZXJhdGVUaW1lIjoxNTg3OTgwNTEwMjQ0LCJ0b2tlblR5cGUiOiJjdXN0b21lciIsImV4cCI6MTYwMzUzMjUxMCwidXNlcklkIjo1ODAyNjkyNDc5MTQwNTA3OTYsInBsYXRmb3JtIjoxfQ.pSVwiWvzyepIUucHs-t3ip-dXMALRs8Q1YwjwYS-HuI";

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

  static Future<List<Dict>> getProductTags() async {
    var response = await NetUtils.get(Api.PRODUCT_TAGS);
    try {
      List data = response['data'];
      return data.map((r){
        return Dict.fromMap(r);
      }).toList();
    } catch (err) {
      return response['message'];
    }
  }

  static Future<List<Product>> getProductRecommendList(int courseType) async {
    var response = await NetUtils.get(Api.PRODUCT_RECOMMEND_LIST, {
      "courseType" : courseType
    });
    try {
      List data = response['data'];
      return data.map((r){
        return Product.fromMap(r);
      }).toList();
    } catch (err) {
      return response['message'];
    }
  }

  static Future<Page> getProductList(int pageNum, int pageSize, int teacherId,
      int productType, int courseType) async {
    var response = await NetUtils.get(Api.PRODUCT_LIST, {
      "pageNum" : pageNum,
      "pageSize" : pageSize,
      "teacherId" : teacherId,
      "productType" : productType,
      "courseType" : courseType,
    });
    try {
      Page page = Page.fromMap(response['data']);
      return page;
    } catch (err) {
      return response['message'];
    }
  }


  static Future<List<Dict>> getTeacherTags() async {
    var response = await NetUtils.get(Api.TEACHER_TAGS);
    try {
      List data = response['data'];
      return data.map((r){
        return Dict.fromMap(r);
      }).toList();
    } catch (err) {
      return response['message'];
    }
  }

  static Future<Page> getTeacherList(int pageNum, int pageSize, int teacherType,
      String keyword) async {
    var response = await NetUtils.get(Api.TEACHER_LIST, {
      "pageNum" : pageNum,
      "pageSize" : pageSize,
      "teacherType" : teacherType,
      "keyword" : keyword,
    });
    try {
      Page page = Page.fromMap(response['data']);
      return page;
    } catch (err) {
      return response['message'];
    }
  }
}