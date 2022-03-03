import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

class Product {
  Product({
    required totalSize,
    required typeId,
    required offset,
    required products,
  }) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        totalSize: json["total_size"],
        typeId: json["type_id"],
        offset: json["offset"],
        products: List<ProductModel>.from(
            json["products"].map((x) => ProductModel.fromJson(x))),
      );
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.img,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.typeId,
  });

  int id;
  String name;
  String description;
  int price;
  int stars;
  String img;
  String location;
  DateTime createdAt;
  DateTime updatedAt;
  int typeId;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        img: json["img"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        typeId: json["type_id"],
      );
}
