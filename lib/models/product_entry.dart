import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    int id;
    int userId;
    String name;
    int price;
    String description;
    String category;
    String? thumbnail;
    int views;
    bool isFeatured;
    String user;
    DateTime createdAt;

    ProductEntry({
        required this.id,
        required this.userId,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.views,
        required this.isFeatured,
        required this.user,
        required this.createdAt,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        views: json["views"],
        isFeatured: json["is_featured"],
        user: json["user"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "views": views,
        "is_featured": isFeatured,
        "user": user,
        "created_at": createdAt.toIso8601String(),
    };
}
