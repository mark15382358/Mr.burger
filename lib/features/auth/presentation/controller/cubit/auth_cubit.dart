import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import 'package:mr_burger/features/auth/domain/usecase/register_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUseCase registerUseCase;

  AuthCubit({required this.registerUseCase}) : super(AuthInitial());

  Future<void> registerUser(RegisterParams params) async {
    emit(RegisterLoading());

    final result = await registerUseCase(params);
    print("auth    ::::Register ");
    result.fold(
      (failure) => emit(RegisterError(message: failure.message)),
      (user) => emit(RegisterSuccess(user: user)),
    );
  }
}
