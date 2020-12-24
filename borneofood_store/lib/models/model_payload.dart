part of 'models.dart';

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());

class Payload {
    Payload({
        this.banner,
        this.category,
        this.product,
    });

    List<Banners> banner;
    List<Category> category;
    List<Product> product;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        banner: List<Banners>.from(json["banner"].map((x) => Banners.fromJson(x))),
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
    };

    // getter
    List<Banners> get getBanner => banner;
    List<Category> get getCategory => category;
    List<Product> get getProduct => product;
}