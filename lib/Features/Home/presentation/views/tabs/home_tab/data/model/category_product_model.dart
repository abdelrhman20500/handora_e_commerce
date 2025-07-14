import '../../domain/entity/category_product_entity.dart';

class CategoryProductModel extends CategoryProductEntity {
  const CategoryProductModel({
    required super.id,
    required super.name,
    required super.description,
    super.additionalDetails,
    required super.sellingPrice,
    super.discountedPrice,
    required super.isOnSale,
    super.salePercent,
    required super.isFavorite,
    required super.category,
    required super.photos,
  });

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) {
    return CategoryProductModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      additionalDetails: json['additionalDetails'],
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      discountedPrice: json['discountedPrice'] != null
          ? (json['discountedPrice'] as num).toDouble()
          : null,
      isOnSale: json['isOnSale'] ?? false,
      salePercent: json['salePercent'] != null
          ? (json['salePercent'] as num).toDouble()
          : null,
      isFavorite: json['isFavorite'] ?? false,
      category: json['category'] ?? '',
      photos: (json['photos'] as List<dynamic>)
          .map((e) => PhotoEntity.fromJson(e as Map<String, dynamic>))
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
    'isFavorite': isFavorite,
    'category': category,
    'photos': photos.map((e) => e.toJson()).toList(),
  };
}
