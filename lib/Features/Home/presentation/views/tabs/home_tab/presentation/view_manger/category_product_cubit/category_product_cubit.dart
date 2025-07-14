import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/category_product_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/category_product_cubit/category_product_state.dart';


class CategoryProductCubit extends Cubit<CategoryProductState>{
  CategoryProductCubit(this.categoryProductUseCase):super(CategoryProductInitial());
  final CategoryProductUseCase categoryProductUseCase;

  Future<void> categoryProductDate({required int id}) async {
    emit(CategoryProductLoading());
    var result = await categoryProductUseCase.call(id);
    result.fold((e) {
      emit(CategoryProductFailure(errMessage: e.message));
    }, (categoryProductEntity) {
      emit(CategoryProductSuccess(categoryProductEntity: categoryProductEntity));
    });
  }
}