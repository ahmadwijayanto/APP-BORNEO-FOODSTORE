import 'dart:convert';

import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/services/services.dart';
import 'package:http/http.dart' as http;

class BannerServices {
  static Future<ApiReturnValue<List<Banner>>> getBanners(
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + 'baner';
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please Try again");
    }
    var data = jsonDecode(response.body);
    List<Banner> banners =
        (data["data"] as Iterable).map((e) => Banner.fromJson(e)).toList();
    return ApiReturnValue(value: banners);
  }
}
