import 'package:dio/dio.dart';
import 'package:unsplashed/network/endpoint.dart';

class DioClient {
  // dio instance
  Dio dio=Dio();
  // injecting dio instance
  DioClient() {
    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = ResponseType.json
      ..options.headers['Authorization'] =Endpoints.clientIDAccessKey
      ..interceptors.add(
          LogInterceptor(
            request: true,
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
          ));
  }

  // Get:-----------------------------------------------------------------------

  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
        String? accessToken,

      }) async {
    try {

      dio
        ..options.baseUrl = Endpoints.baseUrl
        ..options.connectTimeout = Endpoints.connectionTimeout
        ..options.receiveTimeout = Endpoints.receiveTimeout
        ..options.responseType = ResponseType.json
        ..options.headers['Authorization'] =Endpoints.clientIDAccessKey;

      print(options);
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }






}
