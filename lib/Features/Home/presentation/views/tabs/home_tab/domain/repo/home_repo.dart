import 'package:dartz/dartz.dart';
import '../../../../../../../../Core/error/failure.dart';
import '../entity/category_entity.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<CategoryEntity>>> getCategory();
}