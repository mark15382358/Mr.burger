import 'package:dio/dio.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/network/error_message_model.dart';

class ApiExceptions {
  static Failure handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure("Connection timeout with API server");

      case DioExceptionType.sendTimeout:
        return const ServerFailure(
          "Send timeout in connection with API server",
        );

      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
          "Receive timeout in connection with API server",
        );

      case DioExceptionType.badCertificate:
        return const ServerFailure("Bad certificate error");

      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);

      case DioExceptionType.cancel:
        return const ServerFailure("Request to API server was cancelled");

      case DioExceptionType.connectionError:
        return const ServerFailure("No internet connection");

      case DioExceptionType.unknown:
        return const ServerFailure(
          "Unexpected error occurred, please try again later",
        );
    }
  }

  static Failure _handleBadResponse(Response? response) {
    int statusCode = response?.statusCode ?? 0;
    String? serverMessage;

    if (response?.data is Map) {
      try {
        final errorModel = ErrorMessageModel.fromJson(response?.data);

        serverMessage = errorModel.message;
      } catch (e) {
        serverMessage = "Error parsing failure message";
      }
    }

    switch (statusCode) {
      case 400:
      case 422:
        return ServerFailure(serverMessage ?? "Validation error");
      case 401:
        return const ServerFailure("Unauthorized: Session expired");
      case 500:
        return const ServerFailure("Internal server error, please try later");
      default:
        return ServerFailure(serverMessage ?? "Something went wrong");
    }
  }
}
