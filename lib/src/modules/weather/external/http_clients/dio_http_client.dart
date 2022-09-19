import 'package:dio/dio.dart';

import '../../../../core/shared/interfaces/http_client_interface.dart';
import '../../domain/errors/errors.dart';

class DioHttpClient implements IHttpClient {
  final Dio dio;
  const DioHttpClient(this.dio);

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await dio.get(url);
      final data = response.data;
      return data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        throw HttpClientError(
          'Weather forecast not found for city.',
          statusCode: e.response?.statusCode,
        );
      }
      throw HttpClientError(e.message);
    }
  }
}
