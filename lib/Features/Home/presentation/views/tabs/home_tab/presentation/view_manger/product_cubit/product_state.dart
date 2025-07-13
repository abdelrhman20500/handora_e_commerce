import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/product_entity.dart';

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