import 'dart:convert';

FoodImage foodImageFromJson(String str) => FoodImage.fromJson(json.decode(str));

String foodImageToJson(FoodImage data) => json.encode(data.toJson());

class FoodImage {
  FoodImage({
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String image;
  DateTime createdAt;
  DateTime updatedAt;

  FoodImage copyWith({
    String image,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      FoodImage(
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory FoodImage.fromJson(Map<String, dynamic> json) => FoodImage(
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
