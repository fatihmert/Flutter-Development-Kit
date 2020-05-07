import 'dart:io';
import 'package:http/http.dart' as http;

// https://javiercbk.github.io/json_to_dart/
import 'lib/json_to_dart.dart';

class Artisan {
  Future<void> jsonToModelFromFile(
      String modelName, String jsonPath, String writeFileName,
      {bool private: false}) {
    final classGenerator = new ModelGenerator(modelName, private);
    final jsonRawData = new File(jsonPath).readAsStringSync();

    var gen = classGenerator.generateDartClasses(jsonRawData).result.toString();

    File(writeFileName).writeAsString(gen);
  }

  Future<void> jsonToModelFromURL(
      String modelName, String jsonUrl, String writeFileName,
      {bool private: false}) async {
    // Example URL: https://jsonplaceholder.typicode.com/todos/
    final classGenerator = new ModelGenerator(modelName, private);
    var jsonRawData = "";
    var response = await http.get(jsonUrl);

    var gen;

    if (response.statusCode == 200) {
      jsonRawData = response.body;
      gen = classGenerator.generateDartClasses(jsonRawData).result.toString();
    } else {
      throw ('Request failed with status: ${response.statusCode}.');
    }

    File(writeFileName).writeAsString(gen);
  }
}

void main(List<String> arguments) async {
  Artisan artisan = new Artisan();

  var JSON_NAME = arguments[1];
  var MODEL_NAME = arguments[2];
  var IS_PRIVATE = arguments[3] == "true";
  // var IS_URL = arguments[4] == "true";
  var IS_URL = false;
  var MODELS_PATH = arguments[5];

  var findModelFileName = MODELS_PATH + MODEL_NAME.toLowerCase() + '.dart';

  if (IS_URL == true) {
    await artisan.jsonToModelFromURL(MODEL_NAME, JSON_NAME, findModelFileName,
        private: IS_PRIVATE);
  } else {
    await artisan.jsonToModelFromFile(MODEL_NAME, JSON_NAME, findModelFileName,
        private: IS_PRIVATE);
  }
}
