import 'package:dio/dio.dart';


class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = 'No Internet connection';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request : ${error}';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error;
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }


  @override
  String toString() => message;

  static displayError(context,error){
    final message = DioExceptions.fromDioError(error).toString();

  }

}
