import 'package:flutter/foundation.dart';
import '../app/config.dart';
import '../log/log.dart';
import 'CustomTrace.dart';
import '../app/enums.dart';

/*
  Example;
    LogManager log = new LogManager();
    log.line(LogAction.CALLED, 'DRAWER Açıldı');

//
+----------------------------------------------------------------+
| [DEVLOG] 132:48 ⚡ CALLED:: HomeScreen.openDrawer
| >> DRAWER Açıldı
+----------------------------------------------------------------+
//

    log.wrapper("Fonksiyon öncesi", "Fonksiyon sonrası", LogAction.CALLED, this.sampleFunction);

//
--------------------------------------------------
| [DEVLOG] 132:48 ⚡ CALLED:: sampleFunction
| [DEVLOG] 132:48 🔙 Fonksiyon öncesi
Bu bir deneme fonksiyonudur
| [DEVLOG] 132:48 🔜 Fonksiyon sonrası
--------------------------------------------------
//

    log.line(LogAction.CALLED, log.line_return(LogAction.HTTP_RESPONSE, 'HTTP YANITI'));
    //Nestes usage
*/

// Todo
/* Renk eklenecek (ANSI COLOR)*/
// Yardımı sınıflar yazılacak

/* Reflector paketi incelenecek; en basic yapı bu şekilde -- paketsiz çözüldü*/



class LogManager extends Log{
  // Trace
  StackTrace current_trace;
  CustomTrace customTrace;

  // PREFIX
  static const String prefix = '[DEVLOG]';

  // empty param list for default
  static const empty_list = [];

  // Development mode
  DevelopmentMode mode;
  bool mode_status;

  // nested usage tab count
  int tab_count = 3;

  // show time
  bool show_time = true;


  // Alacağı değer: StackTrace.current olmalı
  LogManager(
      {this.mode_status: false, this.tab_count = 3}
  ){
    this.devCheck(setHard: this.mode_status);
    this.tab_count = tab_count;
  }

//  bu fonksiuonun doğru çalışması için Config.mode her değiştirildiğinde tekrar byild almak gerekir.
  DevelopmentMode devCheck({bool setHard: false}){
    mode = Config.mode;

    if(setHard){
      if(Config.mode == DevelopmentMode.DEVELOPMENT){
        mode = DevelopmentMode.CUSTOM_OPTION;
      }else{
        mode = DevelopmentMode.PRODUCTION;
      }
    }

    return mode; //belki kullanırız o yüzden return
  }

  void setTrace(dynamic trace){
    if(trace != null) {
      this.customTrace = CustomTrace(trace);
    }
  }


// Callback ile fonksiyonu wrapper yaparsak çalışmadan önce ve çalıştıktan sonraki dataları görebiliriz.
  //        line no:column no | EVENT_NAME::
//  Ex: [DEVLOG] 12:5
  void printWithPrefix(String str){
    if(this.mode == DevelopmentMode.DEVELOPMENT) {
      try{
        print("| ${LogManager.prefix} ${customTrace.lineNumber}:${customTrace.columnNumber} ${str.toString()}");
      } on NoSuchMethodError catch(e) {
        print("| ${LogManager.prefix} ${str.toString()}");
      }
    }
  }

  void printWithPrefixDetail(String str){
    print("| >> ${str.toString()}");
  }

  String printWithPrefix_return(String str){
    if(this.mode == DevelopmentMode.DEVELOPMENT) {

      try{
        return "| ${LogManager.prefix} ${customTrace.lineNumber}:${customTrace.columnNumber} ${str.toString()}";
      } on NoSuchMethodError catch(e){
        return "| ${LogManager.prefix} ${str.toString()}";
      }

    }
  }

  String printWithPrefixDetail_return(String str){
    return "| >> ${str.toString()}";
  }

//   HELPERS
  String iterateString(String str, int times){
    String res = "";
    for(int i = 0; i < times; i++){
      res += str;
    }
    return res;
  }

  String parseClosureCallbackName(String str){
    RegExp re = new RegExp(r"Function\s?'(.*)'");
    if(re.hasMatch(str)){
      Iterable matches = re.allMatches(str);
      return matches.elementAt(0).group(1).toString();
    }else{
      return '';
    }
  }

//  Parse API addr vs (yardımcı fonksiyon olsun yani dışarıdan erişilebilir (public)

  String addTab(){
    return iterateString(Config.NEW_TAB, this.tab_count);
  }

  String timeFormat(){
    var now = new DateTime.now();

    if (this.show_time){
      // 17.03.20 14:44:52
      return "${now.day}.${now.month}.${now.year} ${now.hour}:${now.minute}.${now.second}";
    }

    return '';
  }

  void max8ParamsFunctionCall(List<dynamic> args, Function callback){
    switch(args.length){
      case 1:
        callback(args[0]);
        break;
      case 2:
        callback(args[0], args[1]);
        break;
      case 3:
        callback(args[0],args[1],args[2]);
        break;
      case 4:
        callback(args[0],args[1],args[2],args[3]);
        break;
      case 5:
        callback(args[0],args[1],args[2],args[3],args[4]);
        break;
      case 6:
        callback(args[0],args[1],args[2],args[3],args[4],args[5]);
        break;
      case 7:
        callback(args[0],args[1],args[2],args[3],args[4],args[5],args[6]);
        break;
      case 8:
        callback(args[0],args[1],args[2],args[3],args[4],args[5],args[6],args[7]);
        break;
      default:
        callback();
        break;
    }
  }

  /*
  * org: testFunction(1, 2, 3, "5");
  * usage: log.funcCallToString(testFunction, [1, 2, 3, "5"]);
  * return: testFunction(1, 2, 3, "5")
  * */
  String funCallToString(Function callback, List<dynamic> args){
    var findFuncName = parseClosureCallbackName(callback.toString());
    if(args.length > 0){
      String argsIterate = "";
      var count = 0;
      args.forEach((element) {
        if(element is String){
          argsIterate += "\"$element\"";
        }else{
          argsIterate += "$element";
        }
        if (count != args.length - 1){
          argsIterate += ",";
        }
        count++;
      });

      return "$findFuncName($argsIterate)";
    }

    return '$findFuncName()';
  }

  only(LogAction event, String detail, {StackTrace trace}){
    String findFunctionName = '';

    if(this.mode == DevelopmentMode.DEVELOPMENT){
      this.setTrace(trace);

      try{
        findFunctionName = customTrace.functionName;
      } on NoSuchMethodError catch(e){
        findFunctionName = "unknown";
      }

    }

    printWithPrefix("${timeFormat()} ⚡ ${describeEnum(event)}:: $findFunctionName");
  }

  just(String detail, {StackTrace trace}){
    String findFunctionName = '';

    if(this.mode == DevelopmentMode.DEVELOPMENT){
      this.setTrace(trace);

      try{
        findFunctionName = customTrace.functionName;
      } on NoSuchMethodError catch(e){
        findFunctionName = "unknown";
      }
    }

    printWithPrefix("${timeFormat()}${Config.NEW_TAB}::${Config.NEW_TAB}$findFunctionName${Config.NEW_TAB}>>${Config.NEW_TAB}$detail");
  }

//  Show short line log
  line(LogAction event, String logDetail, {StackTrace trace}){
    if(this.mode == DevelopmentMode.DEVELOPMENT){
      this.setTrace(trace);
    }


    String findFunctionName = '';
    if (this.mode == DevelopmentMode.DEVELOPMENT) {

      try{
        findFunctionName = customTrace.functionName;
      } on NoSuchMethodError catch(e){
        findFunctionName = "unknown";
      }

      String writeLine = "⚡ ${describeEnum(event)}:: $findFunctionName";

      print("+${iterateString('-', writeLine.length * 2)}+");
      printWithPrefix(writeLine);

      if(logDetail.length > 0){

        printWithPrefixDetail(logDetail);
      }

      print("+${iterateString('-', writeLine.length * 2)}+");
    }
  }

  String line_return(LogAction event, String logDetail){
    String findFunctionName = '';
    if (this.mode == DevelopmentMode.DEVELOPMENT) {
      try{
        findFunctionName = customTrace.functionName;
      } on NoSuchMethodError catch(e){
        findFunctionName = "unknown";
      }

      String result = '';
      String writeLine = "⚡ ${describeEnum(event)}:: $findFunctionName";

      result += writeLine;
      result += "+${iterateString('-', writeLine.length * 2)}+${Config.NEW_LINE}";
      result += "${printWithPrefix_return(writeLine)}${Config.NEW_LINE}";

      if(logDetail.length > 0){
        result += "${printWithPrefix_return(logDetail)}${Config.NEW_LINE}";
      }

      result += "+${iterateString('-', writeLine.length * 2)}+${Config.NEW_LINE}";

      return result;
    }
    return '';
  }

  wrapper(LogAction event, Function callback, {List<dynamic> args = LogManager.empty_list, String beforeTxt:'', String afterTxt:'', StackTrace trace}){
    if(this.mode == DevelopmentMode.DEVELOPMENT){
      this.setTrace(trace);
    }

    if (this.mode == DevelopmentMode.DEVELOPMENT){
      String writeLine = "⚡ ${describeEnum(event)}:: ${funCallToString(callback, args)}";
      print(iterateString('-', writeLine.length*2));
      printWithPrefix(writeLine);

      if(beforeTxt.length > 0){
        printWithPrefixDetail( "🔜 $beforeTxt");
      }

      max8ParamsFunctionCall(args, callback);

      if(afterTxt.length > 0){
        printWithPrefixDetail( "🔜 $afterTxt");
      }

      print(iterateString('-', writeLine.length * 2));
    }
  }
}