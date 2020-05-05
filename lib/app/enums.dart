enum ResponsiveSize{
  WIDTH, HEIGHT
}

enum ViewState {
  Idle,
  Busy                // sunucudan veri alırken filan meşgul durumu
}
// LogManager

enum LogAction{
  CALLED,
  PRESSED,
  HTTP_RESPONSE,
  HTTP_REQUEST,             // herhangi bir post data sunucuya post/get/put/delete...
  API_LOG,
}

enum DevelopmentMode {
  DEVELOPMENT,
  PRODUCTION,
  CUSTOM_OPTION         // belki lazım olur detaylı log vs işleri için
}

enum ApiLog{
  ACTIVE,
  PASSIVE
}

/*
enum PricingDialogType {
  SWIPEABLE,  //kaydırılan
  SELECTABLE //seçilebilen
}*/
