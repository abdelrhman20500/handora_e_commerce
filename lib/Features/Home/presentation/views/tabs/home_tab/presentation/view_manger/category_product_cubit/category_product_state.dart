
import '../../../domain/entity/category_product_entity.dart';

abstract class CategoryProductState{}
class CategoryProductInitial extends CategoryProductState{}
class CategoryProductLoading extends CategoryProductState{}
class CategoryProductFailure extends CategoryProductState{
  final String errMessage;
  CategoryProductFailure({required this.errMessage});
}
class CategoryProductSuccess extends CategoryProductState{
  final List<CategoryProductEntity> categoryProductEntity;
  CategoryProductSuccess({required this.categoryProductEntity});
}