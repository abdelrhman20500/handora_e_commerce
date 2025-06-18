import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/data/data_source/home_remote_data_source.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/data/repo/home_repo_impl.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/category_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/category_cubit/category_cubit.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/category_cubit/category_state.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/widgets/category_component.dart';

class CategoryBlocBuilder extends StatelessWidget {
  const CategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(CategoryUseCase(HomeRepoImpl(
        homeBaseRemoteDataSource: HomeRemoteDataSource(ApiService(Dio(),),),),),
      )..categoryDate(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategorySuccess) {
            return CategoryComponent(model: state.categoryEntity);
          } else {
            // Handle any other states (e.g., CategoryFailure) or return a fallback widget
            return const Center(child: Text("No categories available"));
          }
        },
      ),
    );
  }
}