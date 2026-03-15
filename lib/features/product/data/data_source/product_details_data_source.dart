import 'package:mr_burger/core/constants/api_endpoints.dart';
import 'package:mr_burger/core/error/exceptions..dart';
import 'package:mr_burger/core/network/api_services.dart';
import 'package:mr_burger/features/product/data/model/option_model.dart';

abstract class BaseProductDetailsDataSource {
  Future<List<OptionModel>> getToppings();
  Future<List<OptionModel>> sideOption();
}

class ProductDetailsDataSourceImpl implements BaseProductDetailsDataSource {
  final ApiServices apiServices;
  ProductDetailsDataSourceImpl(this.apiServices);

  @override
  Future<List<OptionModel>> getToppings() async {
    final response = await apiServices.get(ApiEndpoints.grtToppings);

    if (response['data'] != null) {
      return (response['data'] as List)
          .map((e) => OptionModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(message: "Failed to load toppings");
    }
  }

  @override
  Future<List<OptionModel>> sideOption() async {
    final response = await apiServices.get(ApiEndpoints.getSideOption);

    if (response['data'] != null) {
      return (response['data'] as List)
          .map((e) => OptionModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(message: "Failed to load side options");
    }
  }
}