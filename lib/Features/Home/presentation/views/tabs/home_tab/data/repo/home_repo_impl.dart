import 'package:dartz/dartz.dart';
import 'package:handora_e_commerce/Core/error/failure.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/category_entity.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/product_entity.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/repo/home_repo.dart';
import '../../../../../../../../Core/error/exception.dart';
import '../data_source/home_remote_data_source.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeBaseRemoteDataSource homeBaseRemoteDataSource;
  HomeRepoImpl({required this.homeBaseRemoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategory()async{
    try {
      final result= await homeBaseRemoteDataSource.getCategoryData();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct()async{
    try {
      final result= await homeBaseRemoteDataSource.getProduct();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}