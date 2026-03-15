import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/features/product/domain/entity/option_entity.dart';

abstract class BaseProductDetailsRepo {
    Future<Either<Failure, List<OptionEntity>>> getToppings();
    Future<Either<Failure, List<OptionEntity>>> getSlideOptions();
}