import 'package:dio/dio.dart';
import 'package:mr_burger/core/constants/api_endpoints.dart';
import 'package:mr_burger/core/network/api_exceptions.dart';
import 'package:mr_burger/core/network/api_services.dart';
import 'package:mr_burger/core/network/failure.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import '../models/user_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> register(RegisterParams params);
}

class AuthRemoteDataSourceImpl implements BaseAuthRemoteDataSource {
  final ApiServices apiServices;

  AuthRemoteDataSourceImpl(this.apiServices);
  @override
  Future<UserModel> register(RegisterParams params) async {
    final formData = FormData.fromMap({
      'name': params.name,
      'email': params.email,
      'phone': params.phone,
      'password': params.password,
      if (params.image != null)
        'image': await MultipartFile.fromFile(params.image!.path),
    });

    final response = await apiServices.post(ApiEndpoints.register, formData);

if (response is Map<String, dynamic>) {
  return UserModel.fromJson(response);
} else {
  throw ServerFailure(response.toString());
}  }
}
