import 'package:dio/dio.dart';
import 'package:unipos_flutter/models/api/customer/customer.dart';
import 'package:unipos_flutter/repositories/api/http_routes.dart';
import 'package:unipos_flutter/util/log_functions.dart';
part 'requests/welcome.dart';
part 'requests/sales.dart';

class ApiRepository with Welcome, Sales {
  final Dio dio;

  ApiRepository({required this.dio}) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Content-Type'] = 'application/json';
        infoLog('Request: ${options.method} ${options.path}', name: 'Dio');
        warningLog('Request: ${options.uri} ${options.path}', name: 'Dio');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        infoLog("Response:- ${response.statusCode}", name: 'Dio');

        return handler.next(response);
      },
      onError: (DioException e, handler) {
        errorLog('Error: ${e.message}', name: 'Dio');
        return handler.next(e);
      },
    ));
   
  }
}