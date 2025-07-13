import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/product_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/product_cubit/product_state.dart';
import '../../../../../../../../../Core/base_use_case/base_use_case.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit(this.productUseCase):super(ProductInitial());
  final ProductUseCase productUseCase;

  Future<void> productDate() async {
    emit(ProductLoading());
    var result = await productUseCase.call(const NoParameters());
    result.fold((e) {
      emit(ProductFailure(errMessage: e.message));
    }, (productEntity) {
      emit(ProductSuccess(productEntity: productEntity));
    });
  }
}