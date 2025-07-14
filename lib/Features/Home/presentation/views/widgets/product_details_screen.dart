import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/data/data_source/home_remote_data_source.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/data/repo/home_repo_impl.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/product_details_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/product_details_cubit/product_details_cubit.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/widgets/product_details_item.dart';

import '../tabs/home_tab/presentation/view_manger/product_details_cubit/product_details_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.black,)),
        centerTitle: true,
        title:const Text('Product Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: BlocProvider(
        create: (context) => ProductDetailsCubit(ProductDetailsUseCase(HomeRepoImpl(
            homeBaseRemoteDataSource: HomeRemoteDataSource(ApiService(Dio(),),),),),)..productDetailsDate(id: productId),
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if(state is ProductDetailsLoading)
            {
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is ProductDetailsFailure){
              print(state.errMessage);
            }else if(state is ProductDetailsSuccess){
              return BuildProductDetailsItem(model: state.productEntity,);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
