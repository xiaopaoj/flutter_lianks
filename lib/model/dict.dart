
class Dict {
  String dictImage;
  String dictName;
  String dictValue;

  static Dict fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Dict dictBean = Dict();
    dictBean.dictImage = map['dictImage'];
    dictBean.dictName = map['dictName'];
    dictBean.dictValue = map['dictValue'];
    return dictBean;
  }

  Map toJson() => {
    "dictImage": dictImage,
    "dictName": dictName,
    "dictValue": dictValue,
  };
}