import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mr_burger/core/network/failure.dart';

abstract class BaseUsecase<T, parameters> {
  Future<Either<Failure, T>> call(parameters parameters);
}

class NoParameters extends Equatable {
  @override
  List<Object?> get props => [];
}
