import 'package:dartz/dartz.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/add_to_fav_entity.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/category_product_entity.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/product_entity.dart';
import '../../../../../../../../Core/error/failure.dart';
import '../entity/category_entity.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<CategoryEntity>>> getCategory();
  Future<Either<Failure, List<ProductEntity>>> getProduct();
  Future<Either<Failure, List<CategoryProductEntity>>> getCategoryProduct({required int categoryId});
  Future<Either<Failure, ProductEntity>> getProductDetails({required int productId});
  Future<Either<Failure, AddToFavoriteEntity>> addToFav({required int productId});
  Future<Either<Failure, AddToFavoriteEntity>> removeToFav({required int productId});


}