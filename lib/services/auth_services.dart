import 'package:http/http.dart' as http;

import '../utils/my_string.dart';

class AuthServices {
  static Future<String> login(
      {required String email, required String password}) async {
    var response = await http.post(Uri.parse("$baseUrl/auth/local"), body: {
      "identifier": email, "password": password
    });
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 400) {
      return throw "Auth error maybe Email not correct";
    } else {
      return throw "Auth error maybe the internet";
    }
  }

  static Future<String> register(
      {required String name,required String email, required String password}) async {
    var response = await http.post(Uri.parse("$baseUrl/auth/local/register"), body: {
      
      "username":name,
      "email": email,
      "password": password,
      "image":""
       
    });
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 400) {
      return throw "Auth error maybe Email not correct";
    } else {
      return throw "Auth error maybe the internet";
    }
  }
}
