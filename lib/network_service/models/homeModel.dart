class MainModel {
  MainModel({
    required this.id,
    required this.name,
    required this.subCategory,
  });

  final int? id;
  final String? name;
  final List<SubCategory> subCategory;

  factory MainModel.fromJson(Map<String, dynamic> json){
    return MainModel(
      id: json["id"],
      name: json["name"],
      subCategory: json["subCategory"] == null ? [] : List<SubCategory>.from(json["subCategory"]!.map((x) => SubCategory.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "subCategory": subCategory.map((x) => x?.toJson()).toList(),
  };

}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
  });

  final int? id;
  final String? name;
  final String? image;
  final List<Product> products;

  factory SubCategory.fromJson(Map<String, dynamic> json){
    return SubCategory(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "products": products.map((x) => x?.toJson()).toList(),
  };

}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.discountPercentage,
    required this.status,
  });

  final int? id;
  final String? name;
  final String? image;
  final int? price;
  final int? quantity;
  final double? discountPercentage;
  final bool? status;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      price: json["price"],
      quantity: json["quantity"],
      discountPercentage: json["discountPercentage"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "quantity": quantity,
    "discountPercentage": discountPercentage,
    "status": status,
  };

}
