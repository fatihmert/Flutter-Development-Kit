enum ResponsiveSize{
  WIDTH, HEIGHT
}

enum ViewState {
  Idle,
  Busy                // Future processings
}
// LogManager

enum LogAction{
  CALLED,
  PRESSED,
  HTTP_RESPONSE,
  HTTP_REQUEST,             // post/get/put/delete...
  API_LOG,
}

enum DevelopmentMode {
  TESTING, //expanded use trace, time etc...
  DEVELOPMENT,
  PRODUCTION,
  CUSTOM_OPTION         // additional
}

enum ApiLog{
  ACTIVE,
  PASSIVE
}