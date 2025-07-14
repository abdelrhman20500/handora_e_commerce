import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/category_product_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/category_product_cubit/category_product_cubit.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/category_product_cubit/category_product_state.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/widgets/category_product_component.dart';
import '../../../../../Core/function/api_service.dart';
import '../tabs/home_tab/data/data_source/home_remote_data_source.dart';
import '../tabs/home_tab/data/repo/home_repo_impl.dart';

class CategoryProductScreen extends StatelessWidget {
  const CategoryProductScreen({super.key, required this.id, required this.title});
  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
        title: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => CategoryProductCubit(CategoryProductUseCase(HomeRepoImpl(
            homeBaseRemoteDataSource: HomeRemoteDataSource(ApiService(Dio(),),),),),)..categoryProductDate(id: id),
        child: BlocConsumer<CategoryProductCubit,CategoryProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CategoryProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryProductSuccess) {
              return CategoryProductComponent(model: state.categoryProductEntity);
            } else {
              return const Center(child: Text("No Products available"));
            }
          },
        ),
      ),
    );
  }
}
