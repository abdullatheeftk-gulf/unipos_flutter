part of '../api_repository.dart';

mixin Sales {
  Dio get dio;
  Future<List<Customer>> fetchCustomers()async{
    try {
      final response = await dio.get(HttpRoutes.CUSTOMERS);
      if(response.statusCode != 200){
        return Future.error('Error: ${response.statusCode} ${response.statusMessage}');
      }
      final List<Customer> customers = (response.data as List).map((e) => Customer.fromJson(e)).toList();
      return customers;
      
    }on DioException catch (e) {
      final Response? response = e.response;
      if(response != null){
        errorLog('Error: ${response.statusCode} ${response.statusMessage},${response.data}', name: 'API');
        Future.error(response.data['message']?? "Unknown error");
      }else{
        errorLog('Error: ${e.message}', name: 'API');
        Future.error(e.message?? "Unknown error");
      }
      return Future.error(e.message?? "Unknown error");
    } 
    catch (e) {
      return Future.error(e.toString());
    }
  
  }
}