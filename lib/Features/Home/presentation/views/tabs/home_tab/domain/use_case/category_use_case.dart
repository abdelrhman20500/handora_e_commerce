import 'package:dartz/dartz.dart';
import '../../../../../../../../Core/base_use_case/base_use_case.dart';
import '../../../../../../../../Core/error/failure.dart';
import '../entity/category_entity.dart';
import '../repo/home_repo.dart';

class CategoryUseCase extends BaseUseCase<List<CategoryEntity>, NoParameters> {
  final HomeRepo homeRepo;

  CategoryUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParameters parameters) async {
    return await homeRepo.getCategory();
  }
}
