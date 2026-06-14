import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/features/cart/data/data_source/add_to_cart_params.dart';

abstract class BaseCartRepository {
   Future<Either<Failure, void>> addToCart(AddToCartParams params);
}