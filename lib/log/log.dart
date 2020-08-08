abstract class Log{
  void line(String detail, {trace: false}){}
  void request(String url, dynamic payload){}
  void response(String response){}
}
