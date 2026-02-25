import 'package:mr_burger/core/constants/api_endpoints.dart';
import 'package:mr_burger/core/error/exceptions..dart';
import 'package:mr_burger/core/network/api_services.dart';
import 'package:mr_burger/features/home/data/model/category_model.dart';
import 'package:mr_burger/features/home/data/model/product_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<ProductModel>> getProducts({int? categoryId, String? name});
  Future<void> toggleFavorite(int productId);
  Future<List<ProductModel>> getFavorites();
  Future<List<CategoryModel>> getCategories();
}

class HomeRemoteDataSourceImpl implements BaseHomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<ProductModel>> getProducts({
    int? categoryId,
    String? name,
  }) async {
    final response = await apiServices.get(
      ApiEndpoints.getProducts,
      queryParameters: {
        if (name != null) 'name': name,
        if (categoryId != null) 'category_id': categoryId,
      },
    );

    return (response['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> toggleFavorite(int productId) async {
    await apiServices.post(ApiEndpoints.toggleFavorite, {
      'product_id': productId,
    });
  }

  @override
  Future<List<ProductModel>> getFavorites() async {
    final response = await apiServices.get(ApiEndpoints.getFavorites);
    return (response['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiServices.get(ApiEndpoints.getCategories);

    if (response['code'] == 200) {
      return (response['data'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
        message: response['message'] ?? "Error loading categories",
      );
    }
  }
}
