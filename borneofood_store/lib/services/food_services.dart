import 'dart:convert';

import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/services/services.dart';
import 'package:http/http.dart' as http;

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + 'foods';
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please Try again");
    }
    var data = jsonDecode(response.body);
    List<Food> foods =
        (data["data"] as Iterable).map((e) => Food.fromJson(e)).toList();
    return ApiReturnValue(value: foods);
  }
}
