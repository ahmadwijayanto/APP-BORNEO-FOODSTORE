part of 'models.dart';

class Banners {
    Banners({
        this.id,
        this.imageUrl,
    });

    int id;
    String imageUrl;

    factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json["id"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
    };

    // getter
    int get getId => id;
    String get getImageUrl => imageUrl;
}