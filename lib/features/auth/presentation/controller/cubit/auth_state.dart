import 'package:equatable/equatable.dart';
import 'package:mr_burger/features/auth/domain/entity/user_entities.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final UserEntity user;
    final String message;

  const RegisterSuccess({required this.user,required this.message});

  @override
  List<Object?> get props => [user,message];
}

class RegisterError extends AuthState {
  final String message;
  const RegisterError({required this.message});

  @override
  List<Object?> get props => [message];
}
