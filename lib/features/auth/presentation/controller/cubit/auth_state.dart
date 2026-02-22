import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:mr_burger/features/auth/domain/entity/profile_entity.dart';
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

  const RegisterSuccess({required this.user, required this.message});

  @override
  List<Object?> get props => [user, message];
}

class RegisterError extends AuthState {
  final String message;
  const RegisterError({required this.message});

  @override
  List<Object?> get props => [message];
}

class LoginLoading extends AuthState {}

class LoginError extends AuthState {
  final String message;
  const LoginError({required this.message});
  @override
  List<Object?> get props => [message];
}

class LoginSuccess extends AuthState {
  final UserEntity user;

  final String message;
  const LoginSuccess({required this.message, required this.user});
  @override
  List<Object?> get props => [message, user];
}

class GetProfileLoading extends AuthState {}

class GetProfileError extends AuthState {
  final String message;
  const GetProfileError({required this.message});
  @override
  List<Object?> get props => [message];
}

class GetProfileSuccess extends AuthState {
  final ProfileEntity profile;

  final String message;
  const GetProfileSuccess({required this.message, required this.profile});
  @override
  List<Object?> get props => [message, profile];
}

class UpdateProfileLoading extends AuthState {}

class UpdateProfileError extends AuthState {
  final String message;
  const UpdateProfileError({required this.message});
  @override
  List<Object?> get props => [message];
}

class UpdateProfileSuccess extends AuthState {
  final ProfileEntity profile;

  final String message;
  const UpdateProfileSuccess({required this.message, required this.profile});
  @override
  List<Object?> get props => [message, profile];
}
class PickProfileImageSuccess extends AuthState {
  final File image;
const  PickProfileImageSuccess({required this.image});

  @override
  List<Object> get props => [image];
}

class PickProfileImageError extends AuthState {
  final String message;
 const PickProfileImageError({required this.message});

  @override
  List<Object> get props => [message];
}
class LogoutSuccess extends AuthState{
  @override
  List<Object?> get props => [];

}
