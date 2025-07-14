import 'package:equatable/equatable.dart';

class CategoryProductEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String? additionalDetails;
  final double sellingPrice;
  final double? discountedPrice;
  final bool isOnSale;
  final double? salePercent;
  final bool isFavorite;
  final String category;
  final List<PhotoEntity> photos;

  const CategoryProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.additionalDetails,
    required this.sellingPrice,
    required this.discountedPrice,
    required this.isOnSale,
    required this.salePercent,
    required this.isFavorite,
    required this.category,
    required this.photos,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    additionalDetails,
    sellingPrice,
    discountedPrice,
    isOnSale,
    salePercent,
    isFavorite,
    category,
    photos,
  ];
}
class PhotoEntity extends Equatable {
  final int id;
  final String url;

  const PhotoEntity({
    required this.id,
    required this.url,
  });

  factory PhotoEntity.fromJson(Map<String, dynamic> json) {
    return PhotoEntity(
      id: json['id'] as int,
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'url': url,
  };

  @override
  List<Object?> get props => [id, url];
}
