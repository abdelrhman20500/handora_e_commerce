import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/category_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/category_cubit/category_state.dart';
import '../../../../../../../../../Core/base_use_case/base_use_case.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit(this.categoryUseCase): super(CategoryInitial());
  final CategoryUseCase categoryUseCase;

  Future<void> categoryDate() async {
    emit(CategoryLoading());
    var result = await categoryUseCase.call(const NoParameters());
    result.fold((e) {
      emit(CategoryFailure(errMessage: e.message));
    }, (categoryEntity) {
      emit(CategorySuccess(categoryEntity: categoryEntity));
    });
  }
}