import '../app/enums.dart';

class Config{
  // NOTE: mode değişkeninin değiştirilmesi 'debug' durumu için rebuild gerekmektedir.
  static DevelopmentMode mode = DevelopmentMode.DEVELOPMENT;
  static ApiLog API_LOG_STATUS = ApiLog.ACTIVE;

  static String API = "";

  static String NEW_LINE = '\n';
  static String NEW_TAB = '\t';
}