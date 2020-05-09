class DateUtils {

  static String dateFormat(int date){
    DateTime start = DateTime.fromMicrosecondsSinceEpoch(date * 1000);
    return "${start.year}.${start.month}.${start.day} ${start.hour}:${start.minute}";
  }

}