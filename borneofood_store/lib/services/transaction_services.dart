import 'dart:convert';

import 'package:borneofood_store/models/model_user.dart';
import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/models/transcation_model.dart';
import 'package:borneofood_store/services/services.dart';
import 'package:http/http.dart' as http;

class TransactionServices {
  static Future<ApiReturnValue<Transaction>> submitTransaction(int total,
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + "transactions";
    var response = await client.post(url,
        headers: {
          "Authorization": "Bearer ${User.token}",
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, String>{
          "totalPrice": total.toString(),
          "payment_id": "1"
        }));
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }
    var data = jsonDecode(response.body);
    Transaction transaction = Transaction.fromJson(data["data"]);

    return ApiReturnValue(value: transaction);
  }

  static Future<ApiReturnValue<List<Transaction>>> getTransactions(
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + "transactions";
    var response = await client.get(url, headers: {
      "Authorization": "Bearer ${User.token}",
    });
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "failed Load Data");
    }
    print(response.body);
    var data = jsonDecode(response.body);

    List<Transaction> transactions =
        (data["data"] as Iterable).map((e) => Transaction.fromJson(e)).toList();
    return ApiReturnValue(value: transactions);
  }
}
