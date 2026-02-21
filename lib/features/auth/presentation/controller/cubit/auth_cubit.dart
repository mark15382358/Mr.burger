import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseUsecase registerUseCase;

  AuthCubit({required this.registerUseCase}) : super(AuthInitial());

  Future<void> registerUser(RegisterParams params) async {
    emit(RegisterLoading());

    final result = await registerUseCase(params);
    result.fold(
      (failure) => emit(RegisterError(message: failure.message)),
      (user) => emit(RegisterSuccess(user: user,message: user.message)),
    );
  }
}
