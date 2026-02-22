import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/core/utils/pref_helper.dart';
import 'package:mr_burger/core/utils/service_locator.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/login_params.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/update_profile_params.dart';
import 'package:mr_burger/features/auth/domain/entity/profile_entity.dart';
import 'package:mr_burger/features/auth/domain/entity/user_entities.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseUsecase<UserEntity, RegisterParams> registerUseCase;
  final BaseUsecase<UserEntity, LoginParams> loginUseCase;
  final BaseUsecase<ProfileEntity, NoParameters> getProfileUseCase;
  final BaseUsecase<ProfileEntity, UpdateProfileParams> updateProfileUseCase;
  AuthCubit({
    required this.updateProfileUseCase,
    required this.registerUseCase,
    required this.loginUseCase,
    required this.getProfileUseCase,
  }) : super(AuthInitial());

  Future<void> registerUser(RegisterParams params) async {
    emit(RegisterLoading());

    final result = await registerUseCase(params);
    result.fold(
      (failure) => emit(RegisterError(message: failure.message)),
      (user) => emit(RegisterSuccess(user: user, message: user.message)),
    );
  }

  Future<void> loginUser(LoginParams params) async {
    emit(LoginLoading());
    final result = await loginUseCase(params);
    result.fold(
      (failure) => emit(LoginError(message: failure.message)),
      (user) => emit(LoginSuccess(message: user.message, user: user)),
    );
  }

  Future<void> getProfile() async {
    emit(GetProfileLoading());

    final result = await getProfileUseCase(NoParameters());

    result.fold(
      (failure) => emit(GetProfileError(message: failure.message)),
      (profile) =>
          emit(GetProfileSuccess(profile: profile, message: profile.message)),
    );
  }

  Future<void> updateProfile(UpdateProfileParams params) async {
    emit(UpdateProfileLoading());

    final result = await updateProfileUseCase(params);

    result.fold(
      (failure) => emit(UpdateProfileError(message: failure.message)),
      (profile) => emit(
        UpdateProfileSuccess(profile: profile, message: profile.message),
      ),
    );
  }

  ///pickimage
  Future<void> pickImage() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      emit(PickProfileImageSuccess(image: File(image.path)));
    }
  }
///log out
Future<void> logout() async {
  await PrefHelper.clearToken("token"); 
  
  emit(LogoutSuccess());
}
}

