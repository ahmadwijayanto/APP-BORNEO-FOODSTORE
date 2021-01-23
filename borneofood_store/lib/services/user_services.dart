import 'dart:convert';

import 'package:borneofood_store/models/model_user.dart';
import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/services/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Login Failed Bro!");
    }
    var data = jsonDecode(response.body);
    User.token = data["data"]["api_token"];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("api_token", User.token);
    User value = User.fromJson(data["data"]["user"]);
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> register(User user, String password,
      {http.Client client}) async {
    client ??= http.Client();
    print(user.toJson());
    String url = baseURL + "register";
    var response = await client.post(url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode(<String, String>{
          "email": user.email,
          "password": password,
          "name": user.name,
          "password_confirmation": password,
          "address": user.address,
          "phoneNumber": user.phoneNumber,
          "houseNumber": user.houseNumber
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Register Failed Bro!");
    }
    var data = jsonDecode(response.body);
    User.token = data["data"]["api_token"];
    User value = User.fromJson(data["data"]["user"]);
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> fetch(String token,
      {http.Client client}) async {
    client ??= http.Client();
    final url = baseURL + "user";
    final response = await client.get(url, headers: {
      "Authorization": "Bearer $token",
      "Accept": "application/json"
    });
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Token Expired");
    }

    var data = jsonDecode(response.body);
    User.token = token;
    User value = User.fromJson(data["data"]["user"]);
    return ApiReturnValue(value: value);
  }
}
