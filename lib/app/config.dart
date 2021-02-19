import '../app/enums.dart';
import 'enums.dart';

class Config {
  // NOTE: mode değişkeninin değiştirilmesi 'debug' durumu için rebuild gerekmektedir.
  static DevelopmentMode mode = DevelopmentMode.DEVELOPMENT;

  // API Settings

  /*
  * your endpoint full URL without last character /
  * Examples;
  * https://example.com
  * https://example.com/api/v2
  * */

  static String API = "";

  static ApiLog API_LOG_STATUS = ApiLog.ACTIVE;
  static ApiEndPoint API_TEST = ApiEndPoint.TEST;

  // Default Headers
  static Map<String, String> HEADERS = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Cache-Control': 'no-cache',
  };

  // etcs
  static String NEW_LINE = '\n';
  static String NEW_TAB = '\t';
}
