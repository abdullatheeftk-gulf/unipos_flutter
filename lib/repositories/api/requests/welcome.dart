part of '../api_repository.dart';

mixin Welcome {
  Dio get dio;
  Future<String> getWelcomeMessage() async {
    try {
      final Response response = await dio.get(HttpRoutes.WELCOME);

      if (response.statusCode == 200) {
        return response.data['oemName'];
      } else {
        return Future.error(
            'Error: ${response.statusCode} ${response.statusMessage}');
      }
    } on DioException catch (e) {
      final Response? response = e.response;
      if (response != null) {
        errorLog(
            'Error: ${response.statusCode} ${response.statusMessage},${response.data}',
            name: 'API');
        Future.error(response.data['message'] ?? "Unknown error");
      } else {
        errorLog('Error:---- ${e.message}', name: 'API');
        Future.error(e.message ?? "Unknown error");
      }
      return Future.error(e.message ?? "Unknown error");
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
