import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/data/data_source/home_remote_data_source.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/data/repo/home_repo_impl.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/product_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/product_cubit/product_cubit.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/product_cubit/product_state.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/widgets/product_component.dart';

class ProductBlocConsumer extends StatelessWidget {
  const ProductBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(ProductUseCase(HomeRepoImpl(
          homeBaseRemoteDataSource:HomeRemoteDataSource(ApiService(Dio(),),),),),
      )..productDate(),
      child: BlocConsumer<ProductCubit,ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductSuccess) {
          return ProductComponent(model: state.productEntity);
        } else {
          // Handle any other states (e.g., CategoryFailure) or return a fallback widget
          return const Center(child: Text("No categories available"));
        }
          },
      ),
    );
  }
}
