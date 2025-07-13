// import 'package:equatable/equatable.dart';
//
// class ProductEntity extends Equatable {
//   final int id;
//   final String name;
//   // final String image;
//   final String description;
//   final String additionalDetails;
//   final double sellingPrice;
//   final num stock;
//   final num rating;
//   final bool isFavorite;
//   final bool isOnSale;
//
//   const ProductEntity(
//       {required this.id,
//       required this.name,
//       // required this.image,
//       required this.description,
//       required this.additionalDetails,
//       required this.sellingPrice,
//       required this.stock,
//       required this.rating,
//       required this.isFavorite,
//       required this.isOnSale});
//
//   @override
//   List<Object?> get props => [
//         id,
//         name,
//         description,
//         additionalDetails,
//         sellingPrice,
//         stock,
//         rating,
//         isFavorite,
//       ];
// }
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String additionalDetails;
  final double sellingPrice;
  final double? discountedPrice;
  final bool isOnSale;
  final double? salePercent;
  final int stock;
  final bool isFavorite;
  final int rating;
  // final CategoryEntity category;
  final SellerEntity seller;
  final List<PhotoEntity> photos;
  final List<String> colors;
  final List<SizeEntity> sizes;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.additionalDetails,
    required this.sellingPrice,
    this.discountedPrice,
    required this.isOnSale,
    this.salePercent,
    required this.stock,
    required this.isFavorite,
    required this.rating,
    // required this.category,
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
    sellingPrice,
    discountedPrice,
    isOnSale,
    salePercent,
    stock,
    isFavorite,
    rating,
    // category,
    seller,
    photos,
    colors,
    sizes,
  ];
}

// class SellerEntity extends Equatable {
//   final String name;
//   final String email;
//   final String photo;
//
//   const SellerEntity({
//     required this.name,
//     required this.email,
//     required this.photo,
//   });
//
//   @override
//   List<Object?> get props => [name, email, photo];
// }
class SellerEntity extends Equatable {
  final String name;
  final String email;
  final String photo;

  const SellerEntity({
    required this.name,
    required this.email,
    required this.photo,
  });

  factory SellerEntity.fromJson(Map<String, dynamic> json) {
    return SellerEntity(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      photo: json['photo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'photo': photo,
  };

  @override
  List<Object?> get props => [name, email, photo];
}

// class PhotoEntity extends Equatable {
//   final int id;
//   final String url;
//
//   const PhotoEntity({required this.id, required this.url});
//
//   @override
//   List<Object?> get props => [id, url];
// }
class PhotoEntity extends Equatable {
  final int id;
  final String url;

  const PhotoEntity({required this.id, required this.url});

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


// class SizeEntity extends Equatable {
//   final String name;
//   final double extraCost;
//
//   const SizeEntity({required this.name, required this.extraCost});
//
//   @override
//   List<Object?> get props => [name, extraCost];
// }
class SizeEntity extends Equatable {
  final String name;
  final double extraCost;

  const SizeEntity({required this.name, required this.extraCost});

  factory SizeEntity.fromJson(Map<String, dynamic> json) {
    return SizeEntity(
      name: json['name'] ?? '',
      extraCost: (json['extraCost'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'extraCost': extraCost,
  };

  @override
  List<Object?> get props => [name, extraCost];
}
