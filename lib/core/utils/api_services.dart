import 'package:bookly/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await _dio.get("$baseUrl$endpoint");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
