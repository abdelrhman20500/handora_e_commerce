

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/data/data_source/home_remote_data_source.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/data/repo/home_repo_impl.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/use_case/category_use_case.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/category_cubit/category_cubit.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void getData()async{
    var result=CategoryCubit(CategoryUseCase(HomeRepoImpl(
        homeBaseRemoteDataSource: HomeRemoteDataSource(ApiService(Dio(),),),),),
    )..categoryDate();

  }
}