
import 'package:flutter_lianks/api.dart';
import 'package:flutter_lianks/model/dict.dart';
import 'package:flutter_lianks/model/live_top.dart';
import 'package:flutter_lianks/model/page.dart';
import 'package:flutter_lianks/model/product.dart';
import 'package:flutter_lianks/model/user_info.dart';
import 'package:flutter_lianks/model/user_page_data.dart';
import 'package:flutter_lianks/utils/net_utils.dart';
import 'package:flutter_lianks/utils/toast_utils.dart';

import 'local_storage_utils.dart';

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

  static Future<PageBean> getLiveList(int pageNum, int pageSize, int liveType,
      int isPast) async {
    var response = await NetUtils.get(Api.LIVE_LIST, {
      "pageNum" : pageNum,
      "pageSize" : pageSize,
      "liveType" : liveType,
      "isPast" : isPast,
    });
    try {
      PageBean page = PageBean.fromMap(response['data']);
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

  static Future<PageBean> getProductList(int pageNum, int pageSize, int teacherId,
      int productType, int courseType) async {
    var response = await NetUtils.get(Api.PRODUCT_LIST, {
      "pageNum" : pageNum,
      "pageSize" : pageSize,
      "teacherId" : teacherId,
      "productType" : productType,
      "courseType" : courseType,
    });
    try {
      PageBean page = PageBean.fromMap(response['data']);
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

  static Future<PageBean> getTeacherList(int pageNum, int pageSize, int teacherType,
      String keyword) async {
    var response = await NetUtils.get(Api.TEACHER_LIST, {
      "pageNum" : pageNum,
      "pageSize" : pageSize,
      "teacherType" : teacherType,
      "keyword" : keyword,
    });
    try {
      PageBean page = PageBean.fromMap(response['data']);
      return page;
    } catch (err) {
      return response['message'];
    }
  }

  static Future<UserPageData> getMyIndexInfo() async {
    var response = await NetUtils.get(Api.MY_INDEX_INFO);
    try {
      return UserPageData.fromMap(response['data']);
    } catch (err) {
      return response['message'];
    }
  }

  static Future<bool> getValidCode(String phone) async {
    var response = await NetUtils.get(Api.VALID_CODE, {
      "phone": phone
    });
    try {
      ToastUtils.showMessage(response['message']);
      if(response['code'] == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      return response;
    }
  }

  static Future<bool> loginV2(Map<String, dynamic> params) async {
    var response = await NetUtils.post(Api.LOGIN_V2, params);
    try {
      if(response['code'] == 200) {
        ToastUtils.showMessage("登录成功");
        LocalStorageUtils.saveUser(UserInfo.fromMap(response['data']));
        return true;
      } else {
        ToastUtils.showMessage(response['message']);
        return false;
      }
    } catch (err) {
      return response;
    }
  }

  static Future<PageBean> getMyProductList(int pageNum, int pageSize, int courseType,
      int productType) async {
    var response = await NetUtils.get(Api.MY_PRODUCT_LIST, {
      "pageNum" : pageNum,
      "pageSize" : pageSize,
      "productType" : productType,
      "courseType" : courseType,
    });
    try {
      PageBean page = PageBean.fromMap(response['data']);
      return page;
    } catch (err) {
      return response['message'];
    }
  }

  static Future<List<Dict>> getCollectionsTags() async {
    var response = await NetUtils.get(Api.COLLECTIONS_TAGS);
    try {
      List data = response['data'];
      return data.map((r){
        return Dict.fromMap(r);
      }).toList();
    } catch (err) {
      return response['message'];
    }
  }

  static Future<PageBean> getCollectionsList(int pageNum, int pageSize, int sourceType,
      int productType) async {
    var response = await NetUtils.get(Api.COLLECTIONS_LIST, {
      "pageNum" : pageNum,
      "pageSize" : pageSize,
      "sourceType" : sourceType,
      "productType" : productType,
    });
    try {
      PageBean page = PageBean.fromMap(response['data']);
      return page;
    } catch (err) {
      return response['message'];
    }
  }

  static Future<PageBean> getMyOrderList(int pageNum, int pageSize,
      int orderStatus) async {
    var response = await NetUtils.get(Api.MY_ORDERS_LIST, {
      "pageNum" : pageNum,
      "pageSize" : pageSize,
      "orderStatus" : orderStatus,
    });
    try {
      PageBean page = PageBean.fromMap(response['data']);
      return page;
    } catch (err) {
      return response['message'];
    }
  }
}