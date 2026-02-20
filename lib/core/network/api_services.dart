import 'package:dio/dio.dart';
import 'package:mr_burger/core/network/api_exceptions.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);
  //get
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  ///post
  Future<dynamic> post(String endPoint, dynamic body) async {
    try {
      final response = await _dio.post(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  ///put|update
  Future<dynamic> put(String endPoint, dynamic body) async {
    try {
      final response = await _dio.put(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //delete
  Future<dynamic> delete(String endPoint, dynamic body) async {
    try {
      final response = await _dio.delete(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
