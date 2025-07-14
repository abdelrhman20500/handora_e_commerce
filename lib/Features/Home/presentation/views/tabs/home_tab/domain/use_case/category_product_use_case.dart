import 'package:dartz/dartz.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/category_product_entity.dart';
import '../../../../../../../../Core/base_use_case/base_use_case.dart';
import '../../../../../../../../Core/error/failure.dart';
import '../repo/home_repo.dart';

class CategoryProductUseCase extends BaseUseCase<List<CategoryProductEntity>, int> {
  final HomeRepo homeRepo;

  CategoryProductUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<CategoryProductEntity>>> call([int? categoryId]) async {
    return await homeRepo.getCategoryProduct(categoryId: categoryId!);
  }
}
