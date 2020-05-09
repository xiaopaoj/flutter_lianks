
class OrderList {
  int classDateEnd;
  int classDateStart;
  int createTime;
  String detailUrl;
  int goodsCount;
  int orderAmount;
  String orderCode;
  String orderId;
  int orderStatus;
  int productType;
  String showImg;
  String showTitle;
  int standardPrice;
  String studentDetailUrl;

  static OrderList fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    OrderList orderListBean = OrderList();
    orderListBean.classDateEnd = map['classDateEnd'];
    orderListBean.classDateStart = map['classDateStart'];
    orderListBean.createTime = map['createTime'];
    orderListBean.detailUrl = map['detailUrl'];
    orderListBean.goodsCount = map['goodsCount'];
    orderListBean.orderAmount = int.parse(map['orderAmount']);
    orderListBean.orderCode = map['orderCode'];
    orderListBean.orderId = map['orderId'];
    orderListBean.orderStatus = map['orderStatus'];
    orderListBean.productType = map['productType'];
    orderListBean.showImg = map['showImg'];
    orderListBean.showTitle = map['showTitle'];
    orderListBean.standardPrice = int.parse(map['standardPrice']);
    orderListBean.studentDetailUrl = map['studentDetailUrl'];
    return orderListBean;
  }

  Map toJson() => {
    "classDateEnd": classDateEnd,
    "classDateStart": classDateStart,
    "createTime": createTime,
    "detailUrl": detailUrl,
    "goodsCount": goodsCount,
    "orderAmount": orderAmount,
    "orderCode": orderCode,
    "orderId": orderId,
    "orderStatus": orderStatus,
    "productType": productType,
    "showImg": showImg,
    "showTitle": showTitle,
    "standardPrice": standardPrice,
    "studentDetailUrl": studentDetailUrl,
  };
}