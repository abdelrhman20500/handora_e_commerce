import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/product_entity.dart';

abstract class ProductDetailsState{}
class ProductDetailsInitial extends ProductDetailsState{}
class ProductDetailsLoading extends ProductDetailsState{}
class ProductDetailsFailure extends ProductDetailsState{
  final String errMessage;
  ProductDetailsFailure({required this.errMessage});
}
class ProductDetailsSuccess extends ProductDetailsState{
  final ProductEntity productEntity;
  ProductDetailsSuccess({required this.productEntity});
}