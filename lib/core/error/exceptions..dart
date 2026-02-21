
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException({required this.message, this.statusCode});
}
class  LocalDataBaseException implements Exception{
    final String message;
  LocalDataBaseException({required this.message});
}
