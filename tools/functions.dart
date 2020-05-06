// artisan functions

import 'dart:io';
import 'package:http/http.dart' as http;
/*import 'packages/json_to_dart/lib/json_to_dart.dart';

class Artisan{
  DartCode jsonToModelFromFile(String modelName, String jsonPath, {bool private: false}){
    final classGenerator = new ModelGenerator(modelName, private);
    final jsonRawData = new File(jsonPath).readAsStringSync();

    return classGenerator.generateDartClasses(jsonRawData);
  }

  Future<DartCode> jsonToModelFromURL(String modelName, String jsonUrl, {bool private: false}) async{
    // Example URL: https://jsonplaceholder.typicode.com/todos/
    final classGenerator = new ModelGenerator(modelName, private);
    var jsonRawData = "";
    var response = await http.get('https://jsonplaceholder.typicode.com/albums/1');
    if (response.statusCode == 200) {
      jsonRawData = response.body;
      return classGenerator.generateDartClasses(jsonRawData);
    }else {
      throw('Request failed with status: ${response.statusCode}.');
    }
  }
}*/
