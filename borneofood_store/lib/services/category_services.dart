part of 'services.dart';

class CategoryServices {
  static Future<ApiReturnValue<List<Category>>> getCategories(
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + "categories";
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please Try Again");
    }
    var data = jsonDecode(response.body);
    List<Category> categories =
        (data["data"] as Iterable).map((e) => Category.fromJson(e)).toList();
    return ApiReturnValue(value: categories);
  }
}
