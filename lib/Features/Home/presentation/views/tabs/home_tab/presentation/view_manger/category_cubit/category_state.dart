import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/category_entity.dart';

abstract class CategoryState{}
class CategoryInitial extends CategoryState{}
class CategoryLoading extends CategoryState{}
class CategoryFailure extends CategoryState{
  final String errMessage;
  CategoryFailure({required this.errMessage});
}
class CategorySuccess extends CategoryState{
  final List<CategoryEntity> categoryEntity;
  CategorySuccess({required this.categoryEntity});
}