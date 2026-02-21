import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;
  final Map<String, dynamic>? errors; 

  const ErrorMessageModel({
    required this.message,
    this.errors,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      message: json['message'] ?? json['error'] ?? "Unknown Error",
      errors: json['errors'] as Map<String, dynamic>?,
    );
  }

  @override
  List<Object?> get props => [message, errors];
}