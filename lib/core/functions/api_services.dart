import 'package:dio/dio.dart';
import 'package:e_commerce/core/functions/sensitive_data.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rmmvawnbnfdsyjbgturm.supabase.co/rest/v1/',
      headers: {'apikey': anonkey},
    ),
  );
  Future<Response> getData(String endponit) async {
    return await _dio.get(endponit);
  }

  Future<Response> postData(String endponit, Map<String, dynamic> data) async {
    return await _dio.post(endponit, data: data);
  }

  Future<Response> patchData(String endponit, Map<String, dynamic> data) async {
    return await _dio.patch(endponit, data: data);
  }

  Future<Response> deleteData(String endponit) async {
    return await _dio.delete(endponit);
  }
}
