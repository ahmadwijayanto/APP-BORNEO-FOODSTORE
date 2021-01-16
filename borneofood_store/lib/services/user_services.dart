import 'dart:convert';

import 'package:borneofood_store/models/model_user.dart';
import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/services/services.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<ApiReturnValue<User>> login(String email, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseURL + "login";
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));
    print("Call Login");
    print(response.body);
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Login Failed Bro!");
    }
    var data = jsonDecode(response.body);
    User.token = data["data"]["api_token"];
    User value = User.fromJson(data["data"]["user"]);
    return ApiReturnValue(value: value);
  }
}
