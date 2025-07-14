import '../../../domain/entity/add_to_fav_entity.dart';

abstract class AddFavState {}

class AddFavInitial extends AddFavState {}

class AddFavLoading extends AddFavState {}

class AddFavFailure extends AddFavState {
  final String errMessage;
  AddFavFailure({required this.errMessage});
}

class AddFavSuccess extends AddFavState {
  final AddToFavoriteEntity productEntity;
  final bool isFavorite; // true after add

  AddFavSuccess({required this.productEntity, required this.isFavorite});
}

class RemoveFavSuccess extends AddFavState {
  final AddToFavoriteEntity productEntity;
  final bool isFavorite; // false after removal

  RemoveFavSuccess({required this.productEntity}) : isFavorite = false;
}
