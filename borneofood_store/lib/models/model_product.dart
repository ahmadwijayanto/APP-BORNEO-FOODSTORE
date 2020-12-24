part of 'models.dart';

class Product {
    Product({
        this.id,
        this.name,
        this.description,
        this.category,
        this.image,
        this.price,
        this.createdAt,
        this.stock,
    });

    int id;
    String name;
    String description;
    String category;
    String image;
    int price;
    String createdAt;
    int stock;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        price: json["price"],
        createdAt: json["created_at"],
        stock: json["stock"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "image": image,
        "price": price,
        "created_at": createdAt,
        "stock": stock,
    };

    // getter
    int get getId => id;
    String get getName => name;
    String get getDescription => description;
    String get getCategory => category;
    String get getImage => image;
    int get getPrice => price;
    String get getCreatedAt => createdAt;
    int get getStock => stock;
}