
class CollectionProduct {
  String address;
  int classDateEnd;
  int classDateStart;
  String dateTimeStr;
  String detailUrl;
  int isPack;
  int latelyClassDate;
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
  int type;
  String updatedCount;
  String warnTagName;

  static CollectionProduct fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CollectionProduct collectionProductBean = CollectionProduct();
    collectionProductBean.address = map['address'];
    collectionProductBean.classDateEnd = map['classDateEnd'];
    collectionProductBean.classDateStart = map['classDateStart'];
    collectionProductBean.dateTimeStr = map['dateTimeStr'];
    collectionProductBean.detailUrl = map['detailUrl'];
    collectionProductBean.isPack = map['isPack'];
    collectionProductBean.latelyClassDate = map['latelyClassDate'];
    collectionProductBean.likeFlag = map['likeFlag'];
    collectionProductBean.listImage = map['listImage'];
    collectionProductBean.liveStatus = map['liveStatus'];
    collectionProductBean.maxNumber = map['maxNumber'];
    collectionProductBean.originalPrice = map['originalPrice'];
    collectionProductBean.packName = map['packName'];
    collectionProductBean.payCount = map['payCount'];
    collectionProductBean.planCount = map['planCount'];
    collectionProductBean.productId = map['productId'];
    collectionProductBean.productName = map['productName'];
    collectionProductBean.standardPrice = map['standardPrice'];
    collectionProductBean.tagName = map['tagName'];
    collectionProductBean.teachLanguage = map['teachLanguage'];
    collectionProductBean.teacherName = map['teacherName'];
    collectionProductBean.type = map['type'];
    collectionProductBean.updatedCount = map['updatedCount'];
    collectionProductBean.warnTagName = map['warnTagName'];
    return collectionProductBean;
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
    "type": type,
    "updatedCount": updatedCount,
    "warnTagName": warnTagName,
  };
}