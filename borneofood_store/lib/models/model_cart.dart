import 'dart:convert';

import 'package:borneofood_store/models/models.dart';
import 'package:equatable/equatable.dart';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

// ignore: must_be_immutable
class Cart extends Equatable {
  Cart({
    this.id,
    this.qty,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.food,
  });

  int id;
  int qty;
  int total;
  DateTime createdAt;
  DateTime updatedAt;
  Food food;

  Cart copyWith({
    int id,
    int qty,
    int total,
    DateTime createdAt,
    DateTime updatedAt,
    Food food,
  }) =>
      Cart(
        id: id ?? this.id,
        qty: qty ?? this.qty,
        total: total ?? this.total,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        food: food ?? this.food,
      );

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        qty: json["qty"],
        total: json["total"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        food: Food.fromJson(json["food"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "qty": qty,
        "price": total,
        "food_id": food.id,
      };

  @override
  List<Object> get props => [id, qty, total];
}
