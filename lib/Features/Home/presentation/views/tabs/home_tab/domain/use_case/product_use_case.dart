import 'package:dartz/dartz.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/product_entity.dart';
import '../../../../../../../../Core/base_use_case/base_use_case.dart';
import '../../../../../../../../Core/error/failure.dart';
import '../repo/home_repo.dart';

class ProductUseCase extends BaseUseCase<List<ProductEntity>, NoParameters> {
  final HomeRepo homeRepo;

  ProductUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParameters parameters) async {
    return await homeRepo.getProduct();
  }
}
