import '../../domain/entity/add_to_fav_entity.dart';

class AddToFavoriteModel extends AddToFavoriteEntity {
  const AddToFavoriteModel({required super.message});

  factory AddToFavoriteModel.fromJson(dynamic json) {
    // If the response is a raw string, we just cast it
    return AddToFavoriteModel(message: json.toString());
  }

  Map<String, dynamic> toJson() => {
    'message': message,
  };
}
