  
class CollectionTeacher {
  String detailUrl;
  int hotSaleCourseCount;
  int isSign;
  int likeFlag;
  String listImage;
  int score;
  String slogan;
  int startsPrice;
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

  static CollectionTeacher fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CollectionTeacher collectionTeacherBean = CollectionTeacher();
    collectionTeacherBean.detailUrl = map['detailUrl'];
    collectionTeacherBean.hotSaleCourseCount = map['hotSaleCourseCount'];
    collectionTeacherBean.isSign = map['isSign'];
    collectionTeacherBean.likeFlag = map['likeFlag'];
    collectionTeacherBean.listImage = map['listImage'];
    collectionTeacherBean.score = map['score'];
    collectionTeacherBean.slogan = map['slogan'];
    collectionTeacherBean.startsPrice = map['startsPrice'];
    collectionTeacherBean.teachDate = map['teachDate'];
    collectionTeacherBean.teachSect = map['teachSect'];
    collectionTeacherBean.teacherGrade = map['teacherGrade'];
    collectionTeacherBean.teacherId = map['teacherId'];
    collectionTeacherBean.teacherName = map['teacherName'];
    collectionTeacherBean.teacherNationality = map['teacherNationality'];
    collectionTeacherBean.teacherPicture = map['teacherPicture'];
    collectionTeacherBean.teacherTags = map['teacherTags'];
    collectionTeacherBean.teacherType = map['teacherType'];
    collectionTeacherBean.teacherYogaStory = map['teacherYogaStory'];
    return collectionTeacherBean;
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