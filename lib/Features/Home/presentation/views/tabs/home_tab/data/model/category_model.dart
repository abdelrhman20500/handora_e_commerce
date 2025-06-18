import '../../domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required String photo,
  }) : super(
    image: photo,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: (json["id"] as num).toInt(),
      name: json["name"] as String,
      photo: json["photo"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "photo": image, // mapped to 'image' from the entity
    };
  }
}
