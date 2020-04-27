/// bannerList : [{"beginTime":1575129600000,"createdBy":"","createdDt":null,"endTime":1609862400000,"id":"523576875704911252","imgUrl":"https://lianks-picture-uat.oss-cn-beijing.aliyuncs.com/lianks-images/20200420/de2c7d11-0898-4e88-bd2c-28b25524e862.png","linkType":1,"linkUrl":"https://m.lianks.com/LiveDetail.html?id=601259891172050665&isSahre=1&shareSource=lianksapp","relationId":0,"remarks":"","site":2,"sort":1,"status":1,"systemType":0,"title":"banner","updatedBy":"","updatedDt":null},{"beginTime":1584374400000,"createdBy":"","createdDt":null,"endTime":1631808000000,"id":"607118768459482461","imgUrl":"https://lianks-picture-uat.oss-cn-beijing.aliyuncs.com/lianks-images/20200417/198a5e3b-ff3e-4684-be05-606570607dda.png","linkType":1,"linkUrl":"https://m.lianks.com/LiveDetail.html?id=592176107566925045&isSahre=1&shareSource=lianksapp","relationId":0,"remarks":"","site":2,"sort":3,"status":1,"systemType":0,"title":"banner3","updatedBy":"","updatedDt":null},{"beginTime":1555430400000,"createdBy":"","createdDt":null,"endTime":1618588800000,"id":"607121073464411492","imgUrl":"https://lianks-picture-uat.oss-cn-beijing.aliyuncs.com/lianks-images/20200417/3b52f434-56f7-4eb2-9124-7f4ee62f2b8e.png","linkType":1,"linkUrl":"https://m.lianks.com/LiveDetail.html?id=601264340607174385&isSahre=1&shareSource=lianksapp","relationId":0,"remarks":"","site":2,"sort":2,"status":1,"systemType":0,"title":"banner2","updatedBy":"","updatedDt":null},{"beginTime":1587744000000,"createdBy":"","createdDt":null,"endTime":1590249600000,"id":"613447242170238969","imgUrl":"https://lianks-picture-uat.oss-cn-beijing.aliyuncs.com/lianks-images/20200426/4a69f0e5-b52f-496b-9d42-a09c09aeeb7e.png","linkType":1,"linkUrl":"https://m.lianks.com/LiveDetail.html?id=610116153674565507&isSahre=1&shareSource=lianksapp&from=singlemessage&isappinstalled=0","relationId":0,"remarks":"","site":2,"sort":4,"status":1,"systemType":0,"title":"�ճ������е��٤��ϰ","updatedBy":"","updatedDt":null}]
/// living : {"address":"","classDateEnd":null,"classDateStart":1587967200000,"dateTimeStr":"04.27 14:00","detailUrl":"https://m.lianks.com/LiveDetail.html?id=610087266571781820","isPack":0,"latelyClassDate":null,"likeFlag":0,"listImage":"https://lianks-picture-uat.oss-cn-beijing.aliyuncs.com/lianks-images/20200422/e62b5cc6-025a-4b90-8b25-bdfdbb64e5c3.jpg?x-oss-process=style/w700","liveStatus":301,"maxNumber":0,"originalPrice":"0","packName":"","payCount":118,"planCount":"","productId":"610087266571781820","productName":"4.27-Ward-Gentle Flow","standardPrice":"0","tagName":"ֱ����","teachLanguage":"","teacherName":"           ","updatedCount":"","warnTagName":""}
/// livingCount : "1"

class LiveTopModel {
  List<BannerListBean> bannerList;
  LivingBean living;
  String livingCount;

  static LiveTopModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LiveTopModel liveTopBean = LiveTopModel();
    liveTopBean.bannerList = List()..addAll(
      (map['bannerList'] as List ?? []).map((o) => BannerListBean.fromMap(o))
    );
    liveTopBean.living = LivingBean.fromMap(map['living']);
    liveTopBean.livingCount = map['livingCount'];
    return liveTopBean;
  }

  Map toJson() => {
    "bannerList": bannerList,
    "living": living,
    "livingCount": livingCount,
  };
}

/// address : ""
/// classDateEnd : null
/// classDateStart : 1587967200000
/// dateTimeStr : "04.27 14:00"
/// detailUrl : "https://m.lianks.com/LiveDetail.html?id=610087266571781820"
/// isPack : 0
/// latelyClassDate : null
/// likeFlag : 0
/// listImage : "https://lianks-picture-uat.oss-cn-beijing.aliyuncs.com/lianks-images/20200422/e62b5cc6-025a-4b90-8b25-bdfdbb64e5c3.jpg?x-oss-process=style/w700"
/// liveStatus : 301
/// maxNumber : 0
/// originalPrice : "0"
/// packName : ""
/// payCount : 118
/// planCount : ""
/// productId : "610087266571781820"
/// productName : "4.27-Ward-Gentle Flow"
/// standardPrice : "0"
/// tagName : "ֱ����"
/// teachLanguage : ""
/// teacherName : "           "
/// updatedCount : ""
/// warnTagName : ""

class LivingBean {
  String address;
  dynamic classDateEnd;
  int classDateStart;
  String dateTimeStr;
  String detailUrl;
  int isPack;
  dynamic latelyClassDate;
  int likeFlag;
  String listImage;
  int liveStatus;
  int maxNumber;
  String originalPrice;
  String packName;
  int payCount;
  String planCount;
  String productId;
  String productName;
  String standardPrice;
  String tagName;
  String teachLanguage;
  String teacherName;
  String updatedCount;
  String warnTagName;

  static LivingBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LivingBean livingBean = LivingBean();
    livingBean.address = map['address'];
    livingBean.classDateEnd = map['classDateEnd'];
    livingBean.classDateStart = map['classDateStart'];
    livingBean.dateTimeStr = map['dateTimeStr'];
    livingBean.detailUrl = map['detailUrl'];
    livingBean.isPack = map['isPack'];
    livingBean.latelyClassDate = map['latelyClassDate'];
    livingBean.likeFlag = map['likeFlag'];
    livingBean.listImage = map['listImage'];
    livingBean.liveStatus = map['liveStatus'];
    livingBean.maxNumber = map['maxNumber'];
    livingBean.originalPrice = map['originalPrice'];
    livingBean.packName = map['packName'];
    livingBean.payCount = map['payCount'];
    livingBean.planCount = map['planCount'];
    livingBean.productId = map['productId'];
    livingBean.productName = map['productName'];
    livingBean.standardPrice = map['standardPrice'];
    livingBean.tagName = map['tagName'];
    livingBean.teachLanguage = map['teachLanguage'];
    livingBean.teacherName = map['teacherName'];
    livingBean.updatedCount = map['updatedCount'];
    livingBean.warnTagName = map['warnTagName'];
    return livingBean;
  }

  Map toJson() => {
    "address": address,
    "classDateEnd": classDateEnd,
    "classDateStart": classDateStart,
    "dateTimeStr": dateTimeStr,
    "detailUrl": detailUrl,
    "isPack": isPack,
    "latelyClassDate": latelyClassDate,
    "likeFlag": likeFlag,
    "listImage": listImage,
    "liveStatus": liveStatus,
    "maxNumber": maxNumber,
    "originalPrice": originalPrice,
    "packName": packName,
    "payCount": payCount,
    "planCount": planCount,
    "productId": productId,
    "productName": productName,
    "standardPrice": standardPrice,
    "tagName": tagName,
    "teachLanguage": teachLanguage,
    "teacherName": teacherName,
    "updatedCount": updatedCount,
    "warnTagName": warnTagName,
  };
}

/// beginTime : 1575129600000
/// createdBy : ""
/// createdDt : null
/// endTime : 1609862400000
/// id : "523576875704911252"
/// imgUrl : "https://lianks-picture-uat.oss-cn-beijing.aliyuncs.com/lianks-images/20200420/de2c7d11-0898-4e88-bd2c-28b25524e862.png"
/// linkType : 1
/// linkUrl : "https://m.lianks.com/LiveDetail.html?id=601259891172050665&isSahre=1&shareSource=lianksapp"
/// relationId : 0
/// remarks : ""
/// site : 2
/// sort : 1
/// status : 1
/// systemType : 0
/// title : "banner"
/// updatedBy : ""
/// updatedDt : null

class BannerListBean {
  int beginTime;
  String createdBy;
  dynamic createdDt;
  int endTime;
  String id;
  String imgUrl;
  int linkType;
  String linkUrl;
  int relationId;
  String remarks;
  int site;
  int sort;
  int status;
  int systemType;
  String title;
  String updatedBy;
  dynamic updatedDt;

  static BannerListBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BannerListBean bannerListBean = BannerListBean();
    bannerListBean.beginTime = map['beginTime'];
    bannerListBean.createdBy = map['createdBy'];
    bannerListBean.createdDt = map['createdDt'];
    bannerListBean.endTime = map['endTime'];
    bannerListBean.id = map['id'];
    bannerListBean.imgUrl = map['imgUrl'];
    bannerListBean.linkType = map['linkType'];
    bannerListBean.linkUrl = map['linkUrl'];
    bannerListBean.relationId = map['relationId'];
    bannerListBean.remarks = map['remarks'];
    bannerListBean.site = map['site'];
    bannerListBean.sort = map['sort'];
    bannerListBean.status = map['status'];
    bannerListBean.systemType = map['systemType'];
    bannerListBean.title = map['title'];
    bannerListBean.updatedBy = map['updatedBy'];
    bannerListBean.updatedDt = map['updatedDt'];
    return bannerListBean;
  }

  Map toJson() => {
    "beginTime": beginTime,
    "createdBy": createdBy,
    "createdDt": createdDt,
    "endTime": endTime,
    "id": id,
    "imgUrl": imgUrl,
    "linkType": linkType,
    "linkUrl": linkUrl,
    "relationId": relationId,
    "remarks": remarks,
    "site": site,
    "sort": sort,
    "status": status,
    "systemType": systemType,
    "title": title,
    "updatedBy": updatedBy,
    "updatedDt": updatedDt,
  };
}