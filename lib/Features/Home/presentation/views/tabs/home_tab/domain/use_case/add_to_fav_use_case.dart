import 'package:dartz/dartz.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/add_to_fav_entity.dart';
import '../../../../../../../../Core/base_use_case/base_use_case.dart';
import '../../../../../../../../Core/error/failure.dart';
import '../repo/home_repo.dart';

class AddToFavUseCase extends BaseUseCase<AddToFavoriteEntity, int> {
  final HomeRepo homeRepo;

  AddToFavUseCase(this.homeRepo);
  @override
  Future<Either<Failure, AddToFavoriteEntity>> call([int? productId]) async {
    return await homeRepo.addToFav(productId: productId!);
  }
}
