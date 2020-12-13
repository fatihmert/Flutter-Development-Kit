class Validations {
  static Map<String, RegExp> patterns = {
    "email": RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
    "calendar": RegExp(r'^[0,1]?\d{1}\/(([0-2]?\d{1})|([3][0,1]{1}))\/(([1]{1}[9]{1}[9]{1}\d{1})|([2-9]{1}\d{3}))$'),
    "alphanumeric": RegExp(r'^[a-zA-Z0-9]+$'),
    "hex-color": RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
  };

  static bool validateEmail(String value){
    return patterns["email"].hasMatch(value);
  }

  static bool validateCalendarDate(String value){
    return patterns["calendar"].hasMatch(value);
  }

  static bool validateAlphanumeric(String value){
    return patterns["alphanumeric"].hasMatch(value);
  }

  static bool validateHexColor(String value){
    return patterns["hex-color"].hasMatch(value);
  }
}