
class Teacher {
  String detailUrl;
  int hotSaleCourseCount;
  int isSign;
  int likeFlag;
  String listImage;
  double score;
  String slogan;
  String startsPrice;
  int teachDate;
  String teachSect;
  int teacherGrade;
  String teacherId;
  String teacherName;
  String teacherNationality;
  String teacherPicture;
  String teacherTags;
  int teacherType;
  String teacherYogaStory;

  static Teacher fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Teacher teacherBean = Teacher();
    teacherBean.detailUrl = map['detailUrl'];
    teacherBean.hotSaleCourseCount = map['hotSaleCourseCount'];
    teacherBean.isSign = map['isSign'];
    teacherBean.likeFlag = map['likeFlag'];
    teacherBean.listImage = map['listImage'];
    teacherBean.score = map['score'];
    teacherBean.slogan = map['slogan'];
    teacherBean.startsPrice = map['startsPrice'];
    teacherBean.teachDate = map['teachDate'];
    teacherBean.teachSect = map['teachSect'];
    teacherBean.teacherGrade = map['teacherGrade'];
    teacherBean.teacherId = map['teacherId'];
    teacherBean.teacherName = map['teacherName'];
    teacherBean.teacherNationality = map['teacherNationality'];
    teacherBean.teacherPicture = map['teacherPicture'];
    teacherBean.teacherTags = map['teacherTags'];
    teacherBean.teacherType = map['teacherType'];
    teacherBean.teacherYogaStory = map['teacherYogaStory'];
    return teacherBean;
  }

  Map toJson() => {
    "detailUrl": detailUrl,
    "hotSaleCourseCount": hotSaleCourseCount,
    "isSign": isSign,
    "likeFlag": likeFlag,
    "listImage": listImage,
    "score": score,
    "slogan": slogan,
    "startsPrice": startsPrice,
    "teachDate": teachDate,
    "teachSect": teachSect,
    "teacherGrade": teacherGrade,
    "teacherId": teacherId,
    "teacherName": teacherName,
    "teacherNationality": teacherNationality,
    "teacherPicture": teacherPicture,
    "teacherTags": teacherTags,
    "teacherType": teacherType,
    "teacherYogaStory": teacherYogaStory,
  };
}