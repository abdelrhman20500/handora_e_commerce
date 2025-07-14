import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../../Core/base_use_case/base_use_case.dart';
import '../../../domain/use_case/product_use_case.dart';
import '../../../domain/use_case/add_to_fav_use_case.dart';
import '../../../domain/use_case/remove_fav_use_case.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
      this.productUseCase,
      this.addToFavUseCase,
      this.removeFavUseCase,
      ) : super(ProductInitial());

  final ProductUseCase productUseCase;
  final AddToFavUseCase addToFavUseCase;
  final RemoveFavUseCase removeFavUseCase;

  final Map<int, bool> favoriteStatus = {};

  Future<void> productDate() async {
    emit(ProductLoading());

    final result = await productUseCase.call(const NoParameters());

    result.fold(
          (e) => emit(ProductFailure(errMessage: e.message)),
          (productEntity) {
        favoriteStatus.clear();
        for (var product in productEntity) {
          favoriteStatus[product.id] = product.isFavorite;
        }

        emit(ProductSuccess(productEntity: productEntity));
      },
    );
  }

  bool isFavorite(int productId) => favoriteStatus[productId] ?? false;

  Future<void> toggleFavorite(int productId) async {
    final currentFav = isFavorite(productId);

    final result = currentFav
        ? await removeFavUseCase.call(productId)
        : await addToFavUseCase.call(productId);

    result.fold(
          (e) => emit(ProductFailure(errMessage: e.message)),
          (favoriteEntity) {
        // Update favorite status without reloading products
        favoriteStatus[productId] = !currentFav;

        // Emit success state without reloading the product list
        if (currentFav) {
          emit(RemoveFavSuccess(productEntity: favoriteEntity));
        } else {
          emit(AddFavSuccess(productEntity: favoriteEntity, isFavorite: true));
        }
      },
    );
  }
}