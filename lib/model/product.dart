class Product {

  String address;
  int classDateEnd;
  int classDateStart;
  String detailUrl;
  int likeFlag;
  String listImage;
  int maxNumber;
  String originalPrice;
  int payCount;
  String productId;
  String productName;
  String standardPrice;
  String tagName;
  String teachLanguage;
  String teacherName;
  String warnTagName;

  static Product fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Product productBean = Product();
    productBean.address = map['address'];
    productBean.classDateEnd = map['classDateEnd'];
    productBean.classDateStart = map['classDateStart'];
    productBean.detailUrl = map['detailUrl'];
    productBean.likeFlag = map['likeFlag'];
    productBean.listImage = map['listImage'];
    productBean.maxNumber = map['maxNumber'];
    productBean.originalPrice = map['originalPrice'];
    productBean.payCount = map['payCount'];
    productBean.productId = map['productId'];
    productBean.productName = map['productName'];
    productBean.standardPrice = map['standardPrice'];
    productBean.tagName = map['tagName'];
    productBean.teachLanguage = map['teachLanguage'];
    productBean.teacherName = map['teacherName'];
    productBean.warnTagName = map['warnTagName'];
    return productBean;
  }

  Map toJson() => {
    "address": address,
    "classDateEnd": classDateEnd,
    "classDateStart": classDateStart,
    "detailUrl": detailUrl,
    "likeFlag": likeFlag,
    "listImage": listImage,
    "maxNumber": maxNumber,
    "originalPrice": originalPrice,
    "payCount": payCount,
    "productId": productId,
    "productName": productName,
    "standardPrice": standardPrice,
    "tagName": tagName,
    "teachLanguage": teachLanguage,
    "teacherName": teacherName,
    "warnTagName": warnTagName,
  };
}