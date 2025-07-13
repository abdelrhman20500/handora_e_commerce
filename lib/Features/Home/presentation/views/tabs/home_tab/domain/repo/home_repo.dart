import 'package:dartz/dartz.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/product_entity.dart';
import '../../../../../../../../Core/error/failure.dart';
import '../entity/category_entity.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<CategoryEntity>>> getCategory();
  Future<Either<Failure, List<ProductEntity>>> getProduct();
}