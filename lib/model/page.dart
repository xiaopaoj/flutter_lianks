
class PageBean {
  List<dynamic> dataList;
  int pageNum;
  int pageSize;
  int pages;
  int size;
  int totalRows;

  static PageBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    PageBean pageBean = PageBean();
    pageBean.dataList = List()..addAll(
      (map['dataList'] as List ?? []).map((o) => o)
    );
    pageBean.pageNum = map['pageNum'];
    pageBean.pageSize = map['pageSize'];
    pageBean.pages = map['pages'];
    pageBean.size = map['size'];
    pageBean.totalRows = int.parse(map['totalRows']);
    return pageBean;
  }

  Map toJson() => {
    "dataList": dataList,
    "pageNum": pageNum,
    "pageSize": pageSize,
    "pages": pages,
    "size": size,
    "totalRows": totalRows,
  };
}