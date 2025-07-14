import 'package:equatable/equatable.dart';

class ProductDetailsEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String? additionalDetails;
  final int stock;
  final double sellingPrice;
  final double? discountedPrice;
  final double? salePercent;
  final bool isFavorite;
  final CategoryEntity category;
  final SellerEntity seller;
  final List<PhotoEntity> photos;
  final List<String> colors;
  final List<SizeEntity> sizes; // Defined as empty in response, but kept for scalability

  const ProductDetailsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.additionalDetails,
    required this.stock,
    required this.sellingPrice,
    this.discountedPrice,
    this.salePercent,
    required this.isFavorite,
    required this.category,
    required this.seller,
    required this.photos,
    required this.colors,
    required this.sizes,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    additionalDetails,
    stock,
    sellingPrice,
    discountedPrice,
    salePercent,
    isFavorite,
    category,
    seller,
    photos,
    colors,
    sizes,
  ];
}
class CategoryEntity extends Equatable {
  final int id;
  final String name;

  const CategoryEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}

class SellerEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String photo;

  const SellerEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
  });

  @override
  List<Object?> get props => [id, name, email, photo];
}

class PhotoEntity extends Equatable {
  final int id;
  final String url;

  const PhotoEntity({
    required this.id,
    required this.url,
  });

  @override
  List<Object?> get props => [id, url];
}

class SizeEntity extends Equatable {
  final String name;
  final double extraCost;

  const SizeEntity({
    required this.name,
    required this.extraCost,
  });

  @override
  List<Object?> get props => [name, extraCost];
}
