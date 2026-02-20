import 'package:dio/dio.dart';
import 'package:mr_burger/core/network/failure.dart';

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
      serverMessage = response?.data['message'] ?? response?.data['error'];
    }

    switch (statusCode) {
      case 400:
        return ServerFailure(serverMessage ?? "Bad request");
      case 401:
        return const ServerFailure("Unauthorized: Session expired");
      case 403:
        return const ServerFailure(
          "Forbidden: You don't have permission to access this",
        );
      case 404:
        return const ServerFailure("Request not found");
      case 500:
        return const ServerFailure("Internal server error, please try later");
      default:
        return ServerFailure(serverMessage ?? "Something went wrong");
    }
  }
}
