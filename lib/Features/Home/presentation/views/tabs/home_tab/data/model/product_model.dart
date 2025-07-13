// import '../../domain/entity/product_entity.dart';
//
// class ProductModel extends ProductEntity {
//   final dynamic discountedPrice;
//   final dynamic salePercent;
//   // final Category? category;
//   // final Seller? seller;
//   // final List<Photos>? photos;
//   final List<dynamic>? colors;
//   final List<dynamic>? sizes;
//
//   const ProductModel({
//     required super.id,
//     required super.name,
//     required super.description,
//     required super.additionalDetails,
//     required super.sellingPrice,
//     required super.stock,
//     required super.rating,
//     required super.isFavorite,
//     required super.isOnSale,
//     this.discountedPrice,
//     this.salePercent,
//     // this.category,
//     // this.seller,
//     // this.photos,
//     this.colors,
//     this.sizes,
//   });
//
//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: (json["id"] as num).toInt(),
//       name: json["name"] ?? '',
//       description: json["description"] ?? '',
//       additionalDetails: json["additionalDetails"] ?? '',
//       sellingPrice: (json["sellingPrice"] as double),
//       discountedPrice: json["discountedPrice"],
//       isOnSale: json["isOnSale"] ?? false,
//       salePercent: json["salePercent"],
//       stock: (json["stock"] as num),
//       isFavorite: json["isFavorite"] ?? false,
//       rating: (json["rating"] as num),
//       // category: json["category"] != null ? Category.fromJson(json["category"]) : null,
//       // seller: json["seller"] != null ? Seller.fromJson(json["seller"]) : null,
//       // photos: (json["photos"] as List?)?.map((e) => Photos.fromJson(e)).toList(),
//       colors: json["colors"] ?? [],
//       sizes: json["sizes"] ?? [],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "name": name,
//       "description": description,
//       "additionalDetails": additionalDetails,
//       "sellingPrice": sellingPrice,
//       "discountedPrice": discountedPrice,
//       "isOnSale": isOnSale,
//       "salePercent": salePercent,
//       "stock": stock,
//       "isFavorite": isFavorite,
//       "rating": rating,
//       // "category": category?.toJson(),
//       // "seller": seller?.toJson(),
//       // "photos": photos?.map((e) => e.toJson()).toList(),
//       "colors": colors,
//       "sizes": sizes,
//     };
//   }
// }
import '../../domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.additionalDetails,
    required super.sellingPrice,
    super.discountedPrice,
    required super.isOnSale,
    super.salePercent,
    required super.stock,
    required super.isFavorite,
    required super.rating,
    required super.seller,
    required super.photos,
    required super.colors,
    required super.sizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      additionalDetails: json['additionalDetails'] ?? '',
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      discountedPrice: json['discountedPrice'] != null
          ? (json['discountedPrice'] as num).toDouble()
          : null,
      isOnSale: json['isOnSale'] ?? false,
      salePercent: json['salePercent'] != null
          ? (json['salePercent'] as num).toDouble()
          : null,
      stock: json['stock'] ?? 0,
      isFavorite: json['isFavorite'] ?? false,
      rating: json['rating'] ?? 0,
      seller: SellerEntity.fromJson(json['seller']),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => PhotoEntity.fromJson(e))
          .toList(),
      colors: List<String>.from(json['colors'] ?? []),
      sizes: (json['sizes'] as List<dynamic>)
          .map((e) => SizeEntity.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'additionalDetails': additionalDetails,
    'sellingPrice': sellingPrice,
    'discountedPrice': discountedPrice,
    'isOnSale': isOnSale,
    'salePercent': salePercent,
    'stock': stock,
    'isFavorite': isFavorite,
    'rating': rating,
    'seller': seller.toJson(),
    'photos': photos.map((e) => e.toJson()).toList(),
    'colors': colors,
    'sizes': sizes.map((e) => e.toJson()).toList(),
  };
}

