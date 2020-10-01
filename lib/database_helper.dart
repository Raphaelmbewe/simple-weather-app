import 'dart:convert' show json;
import 'package:http/http.dart' as http;

//  class to hold our Database Functions
class DataBaseHelper {
  Future fetchData({String city}) async {
    String api = 'http://api.openweathermap.org/data/2.5/weather';
    String appId = "717d16ccc2decfde7b2b13d5ad73a17e";

    String url = '$api?q=$city&units=metric&APPID=$appId';

    http.Response response = await http.get(url);

    var results = json.decode(response.body);

    return results;
  }
}
