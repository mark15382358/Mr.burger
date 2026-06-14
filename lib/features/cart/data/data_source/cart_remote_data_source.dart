// import الـ Models بتاعتك هنا

import 'package:dio/dio.dart';
import 'package:mr_burger/core/constants/api_endpoints.dart';
import 'package:mr_burger/core/error/exceptions..dart';
import 'package:mr_burger/core/network/api_exceptions.dart';
import 'package:mr_burger/core/network/api_services.dart';
import 'package:mr_burger/features/cart/data/data_source/add_to_cart_params.dart';

abstract class BaseCartRemoteDataSource {
  Future<void> addToCart(AddToCartParams params);

  Future<dynamic> getCart(); 

  Future<void> removeFromCart(int productId);

  Future<void> updateCartQuantity(int productId, int quantity);
}


class CartRemoteDataSourceImpl implements BaseCartRemoteDataSource {
  final ApiServices apiServices;

  CartRemoteDataSourceImpl(this.apiServices);

  @override
  @override
Future<void> addToCart(AddToCartParams params) async {
  try {
    final response = await apiServices.post(
      ApiEndpoints.addToCart, 
      params.toJson(),
    );
    
  } on DioException catch (e) {
    final failure = ApiExceptions.handleError(e);
    
    throw ServerException(message: failure.message);
  } catch (e) {
    throw ServerException(message: e.toString());
  }
}

  @override
  Future<dynamic> getCart() async {
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromCart(int productId) async {
    throw UnimplementedError();
  }

  @override
  Future<void> updateCartQuantity(int productId, int quantity) async {
    throw UnimplementedError();
  }
}