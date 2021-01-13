part of 'models.dart';

class Food {
    Food({
        this.id,
        this.name,
        this.description,
        this.category,
        this.images,
        this.price,
        this.createdAt,
        this.stock,
    });

    int id;
    String name;
    String description;
    String category;
    List<FoodImage> images;
    int price;
    String createdAt;
    int stock;

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        images: List<FoodImage>.from(
            json["images"].map((x) => FoodImage.fromJson(x))
        ),
        price: json["price"],
        createdAt: json["created_at"],
        stock: json["stock"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "price": price,
        "created_at": createdAt,
        "stock": stock,
    };

    // getter
    int get getId => id;
    String get getName => name;
    String get getDescription => description;
    String get getCategory => category;
    List<FoodImage> get getImages => images;
    int get getPrice => price;
    String get getCreatedAt => createdAt;
    int get getStock => stock;
}