import 'package:ecommerce_app_huma_volve/core/api/api_manger.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';
import '../../../../core/constants/api_endpoints.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSource{
  ApiClient apiClient;
  HomeRemoteDataSourceImp(this.apiClient);
  @override
  Future<List<CategoryModel>> getCategories() async{
    final response = await ApiClient().dio.get(
      ApiEndpoints.categoriesEndpoint,
    );
    final List jsonData = response.data;
    final List<CategoryModel> dartData = jsonData
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return dartData;
  }

  @override
  Future<List<ProductModel>> getProducts(int? categoryId) async{
    final response = await ApiClient().dio.get(
      "${ApiEndpoints.categoriesEndpoint}/$categoryId/${ApiEndpoints.productsEndpoint}",
    );
    final List jsonData = response.data;
    final List<ProductModel> dartData = jsonData
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return dartData;
  }

}