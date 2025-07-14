import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/product_entity.dart';

import '../../../domain/entity/add_to_fav_entity.dart';

abstract class ProductState{}
class ProductInitial extends ProductState{}
class ProductLoading extends ProductState{}
class ProductFailure extends ProductState{
  final String errMessage;
  ProductFailure({required this.errMessage});
}
class ProductSuccess extends ProductState{
  final List<ProductEntity> productEntity;
  ProductSuccess({required this.productEntity});
}
class AddFavFailure extends ProductState {
  final String errMessage;
  AddFavFailure({required this.errMessage});
}
class RemoveFavFailure extends ProductState {
  final String errMessage;
  RemoveFavFailure({required this.errMessage});
}
class AddFavSuccess extends ProductState {
  final AddToFavoriteEntity productEntity;
  final bool isFavorite; // true after add

  AddFavSuccess({required this.productEntity, required this.isFavorite});
}

class RemoveFavSuccess extends ProductState {
  final AddToFavoriteEntity productEntity;
  final bool isFavorite; // false after removal

  RemoveFavSuccess({required this.productEntity}) : isFavorite = false;
}