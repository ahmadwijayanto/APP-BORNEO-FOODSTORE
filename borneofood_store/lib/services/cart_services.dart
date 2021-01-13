import 'dart:convert';

import 'package:borneofood_store/models/model_cart.dart';
import 'package:borneofood_store/models/model_user.dart';
import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/services/services.dart';
import 'package:http/http.dart' as http;

class CartServices {
  static Future<ApiReturnValue<List<Cart>>> getCarts(
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + "carts";
    var response = await client
        .get(url, headers: {"Authorization": "Bearer ${User.token}"});
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }
    var data = jsonDecode(response.body);
    List<Cart> carts =
        (data["data"] as Iterable).map((cart) => Cart.fromJson(cart)).toList();
    return ApiReturnValue(value: carts);
  }

  static Future<ApiReturnValue<Cart>> submitCart(Cart cart,
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + "carts";
    var response = await client.post(url,
        headers: {
          "Authorization": "Bearer ${User.token}",
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, String>{
          "food_id": cart.food.id.toString(),
          "qty": cart.qty.toString(),
          "total": cart.total.toString()
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }
    var data = jsonDecode(response.body);

    Cart value = Cart.fromJson(data["data"]);
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> deleteCart(int id,
      {http.Client client}) async {
    client ??= http.Client();
    var url = baseURL + "carts/$id";
    var response = await client.delete(url, headers: {
      "Authorization": "Bearer ${User.token}",
    });
    if (response.statusCode == 200) {
      return ApiReturnValue(value: "Success");
    } else {
      return ApiReturnValue(message: "Failed");
    }
  }

  static Future<ApiReturnValue<Cart>> updateCart(Cart cart,
      {http.Client client}) async {
    client ??= http.Client();
    var url = baseURL + "carts/${cart.id}";
    var response = await client.put(url,
        headers: {
          "Authorization": "Bearer ${User.token}",
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, String>{
          "food_id": cart.food.id.toString(),
          "qty": cart.qty.toString(),
          "total": (cart.qty * cart.food.price).toString()
        }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Cart value = Cart.fromJson(data["data"]);
      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: "Failed");
    }
  }
}
