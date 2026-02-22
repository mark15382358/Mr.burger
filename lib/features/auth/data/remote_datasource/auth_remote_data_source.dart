import 'package:dio/dio.dart';
import 'package:mr_burger/core/constants/api_endpoints.dart';
import 'package:mr_burger/core/network/api_services.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/error/exceptions..dart';
import 'package:mr_burger/features/auth/data/models/profile_model.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/login_params.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/update_profile_params.dart';
import '../models/user_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> register(RegisterParams params);
  Future<UserModel> login(LoginParams params);
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile(UpdateProfileParams params);
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
    } else if (response is ServerFailure) {
      throw ServerException(message: response.message);
    } else {
      throw ServerFailure("Unexpected error occurred");
    }
  }

  @override
  Future<UserModel> login(LoginParams params) async {
    final formData = FormData.fromMap({
      'email': params.email,
      "password": params.password,
    });
    final response = await apiServices.post(ApiEndpoints.login, formData);
    if (response is Map<String, dynamic>) {
      return UserModel.fromJson(response);
    } else if (response is ServerFailure) {
      throw ServerException(message: response.message);
    } else {
      throw ServerFailure("Unexpected error occurred");
    }
  }

  @override
  Future<ProfileModel> getProfile() async {
    final response = await apiServices.get(ApiEndpoints.getProfile);
    if (response is Map<String, dynamic>) {
      return ProfileModel.fromJson(response);
    } else if (response is ServerFailure) {
      throw ServerException(message: response.message);
    } else {
      throw ServerFailure("Unexpected error occurred");
    }
  }

  @override
  Future<ProfileModel> updateProfile(UpdateProfileParams params) async {
    try {
      FormData formData = FormData.fromMap({
        "name": params.name,
        "email": params.email,
        "address": params.address,
        if (params.image != null)
          "image": await MultipartFile.fromFile(
            params.image!.path,
            filename: params.image!.path.split('/').last,
          ),
      });

      final response = await apiServices.post(
        ApiEndpoints.updateProfile,
        formData,
      );
      return ProfileModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
