import 'dart:convert';

import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/models/payment_model.dart';

Transaction transactionFromJson(String str) =>
    Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
  Transaction(
      {this.id,
      this.totalPrice,
      this.createdAt,
      this.updatedAt,
      this.items,
      this.payment,
      this.invoice});

  int id;
  int totalPrice;
  DateTime createdAt;
  String invoice;
  DateTime updatedAt;
  List<Item> items;
  Payment payment;

  Transaction copyWith({
    int id,
    int totalPrice,
    DateTime createdAt,
    DateTime updatedAt,
    List<Item> items,
    String incoice,
    Payment payment,
  }) =>
      Transaction(
          id: id ?? this.id,
          totalPrice: totalPrice ?? this.totalPrice,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          items: items ?? this.items,
          payment: payment ?? this.payment,
          invoice: invoice ?? this.invoice);

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
      id: json["id"],
      totalPrice: json["totalPrice"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      payment: Payment.fromJson(json["payment"]),
      invoice: json["invoice"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalPrice": totalPrice,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "payment": payment.toJson(),
      };
}

class Item {
  Item({
    this.id,
    this.qty,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.food,
  });

  int id;
  int qty;
  int price;
  DateTime createdAt;
  DateTime updatedAt;
  Food food;

  Item copyWith({
    int id,
    int qty,
    int price,
    DateTime createdAt,
    DateTime updatedAt,
    Food food,
  }) =>
      Item(
        id: id ?? this.id,
        qty: qty ?? this.qty,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        food: food ?? this.food,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        qty: json["qty"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        food: Food.fromJson(json["food"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "qty": qty,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "food": food.toJson(),
      };
}
