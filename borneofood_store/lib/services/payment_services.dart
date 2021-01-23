import 'dart:convert';

import 'package:borneofood_store/models/model_user.dart';
import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/models/payment_model.dart';
import 'package:borneofood_store/services/services.dart';
import 'package:http/http.dart' as http;

class PaymentServices {
  static Future<ApiReturnValue<List<Payment>>> getPayments(
      {http.Client client}) async {
    client ??= http.Client();
    final url = baseURL + "payments";
    final response = await client.get(url, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${User.token}"
    });
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Data Payment dGagal Di Muat");
    }
    var data = jsonDecode(response.body);
    List<Payment> payments =
        (data["data"] as Iterable).map((e) => Payment.fromJson(e)).toList();
    return ApiReturnValue(value: payments);
  }
}
