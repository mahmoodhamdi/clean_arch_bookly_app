import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromException(Exception exception) {
    return ServerFailure(errorMessage: exception.toString());
  }
  factory ServerFailure.fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return ServerFailure(errorMessage: "Bad request");
      case 401:
        return ServerFailure(errorMessage: "Unauthorized");
      case 403:
        return ServerFailure(errorMessage: "Forbidden");
      case 404:
        return ServerFailure(errorMessage: "Not found");
      case 500:
        return ServerFailure(errorMessage: "Internal server error");
      default:
        return ServerFailure(errorMessage: "Oops something went wrong");
    }
  }
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: "Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: "Connection timeout with API server");
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage:
                "Connection to API server failed due to internet connection");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errorMessage: "Receive timeout in connection with API server");
      case DioExceptionType.badResponse:
        return ServerFailure(
            errorMessage:
                "Invalid status code: ${dioException.response?.statusCode}");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "Invalid certificate");
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errorMessage: "Send timeout in connection with API server");
      default:
        return ServerFailure(errorMessage: "Something went wrong");
    }
  }
}
