import 'package:intl/intl.dart';

class DateCovert {
  ///时间戳转换为时间
  ///[pattern]类型为转化的格式，如'yyyy/MM/dd HH:mm'
  ///[location]时间格式的区域
  static String timeToDate(String time, String pattern,
      [String location = 'en_US']) {
    if (time == null || pattern == null) {
      return null;
    }
    try {
      final format = new DateFormat(pattern, location);
      return format.format(DateTime.now());
    } catch (e) {}
    return null;
  }

  ///时间转换为时间戳
  ///[pattern]类型为时间的格式，如'yyyy/MM/dd HH:mm'
  ///[location]时间格式的区域
  static int dateToTime(String date, String pattern,
      [String location = 'en_US']) {
    if (date == null || pattern == null) {
      return null;
    }
    try {
      final format = new DateFormat(pattern, location);
      DateTime dateTime = format.parse(date);
      return dateTime.millisecondsSinceEpoch;
    } catch (e) {}
    return null;
  }

  ///时间格式转化
  ///[inpattern]类型为输入日期的格式，如'yyyy/MM/dd HH:mm'
  ///[outpattern]类型为输出日期的格式，如'yyyy/MM/dd HH:mm'
  ///[location]时间格式的区域
  static String dateToOther(String date, String inPattern, String outPattern,
      [String location = 'en_US']) {
    if (date == null || inPattern == null || outPattern == null) {
      return null;
    }
    try {
      final informat = new DateFormat(inPattern, location);
      final outformat = new DateFormat(outPattern);
      return outformat.format(informat.parse(date));
    } catch (e) {}
    return null;
  }

}
