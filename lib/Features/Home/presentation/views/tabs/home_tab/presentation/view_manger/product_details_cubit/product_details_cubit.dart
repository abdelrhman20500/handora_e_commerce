import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/product_details_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/product_details_cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState>{
  ProductDetailsCubit(this.productDetailsUseCase):super(ProductDetailsInitial());
  final ProductDetailsUseCase productDetailsUseCase;

  Future<void> productDetailsDate({required int id}) async {
    emit(ProductDetailsLoading());
    var result = await productDetailsUseCase.call(id);
    result.fold((e) {
      emit(ProductDetailsFailure(errMessage: e.message));
    }, (productEntity) {
      emit(ProductDetailsSuccess(productEntity: productEntity));
    });
  }
}