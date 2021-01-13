part of 'models.dart';

class Banner {
  Banner({
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String image;
  DateTime createdAt;
  DateTime updatedAt;

  Banner copyWith({
    String image,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Banner(
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
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
