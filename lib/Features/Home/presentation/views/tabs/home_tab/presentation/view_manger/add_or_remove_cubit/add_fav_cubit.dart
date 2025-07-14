import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/add_to_fav_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/remove_fav_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/add_or_remove_cubit/add_fav_state.dart';

class AddFavCubit extends Cubit<AddFavState> {
  AddFavCubit(this.addToFavUseCase, this.removeFavUseCase) : super(AddFavInitial());

  final AddToFavUseCase addToFavUseCase;
  final RemoveFavUseCase removeFavUseCase;

  Future<void> addToFavorite({required int id}) async {
    emit(AddFavLoading());
    final result = await addToFavUseCase.call(id);
    result.fold(
          (e) => emit(AddFavFailure(errMessage: e.message)),
          (productEntity) => emit(AddFavSuccess(productEntity: productEntity, isFavorite: true)),
    );
  }

  Future<void> removeFromFavorite({required int id}) async {
    emit(AddFavLoading());
    final result = await removeFavUseCase.call(id);
    result.fold(
          (e) => emit(AddFavFailure(errMessage: e.message)),
          (productEntity) => emit(RemoveFavSuccess(productEntity: productEntity)),
    );
  }
}
