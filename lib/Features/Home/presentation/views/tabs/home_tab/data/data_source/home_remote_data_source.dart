import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/data/model/product_model.dart';

import '../../../../../../../../Core/error/error_message_model.dart';
import '../../../../../../../../Core/error/exception.dart';
import '../model/category_model.dart';

abstract class HomeBaseRemoteDataSource {
  Future<List<CategoryModel>> getCategoryData();
  Future<List<ProductModel>> getProduct();

}

class HomeRemoteDataSource extends HomeBaseRemoteDataSource{

  final ApiService apiService;

  HomeRemoteDataSource(this.apiService);
  @override
  Future<List<CategoryModel>> getCategoryData()async{
    var response = await apiService.get(endpoint: "Categories");
    if (response.statusCode == 200) {
      // print(response);
      return List<CategoryModel>.from(
          response.data.map((e) => CategoryModel.fromJson(e))
      );
    } else {
      {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }
  }

  @override
  Future<List<ProductModel>> getProduct() async {
    var response = await apiService.get(
      endpoint: "Products/GetAllWithFilter?pageSize=24&pageIndex=1",
    );

    if (response.statusCode == 200) {
      final List productsJson = response.data["products"];
      print(productsJson);
      return productsJson.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}