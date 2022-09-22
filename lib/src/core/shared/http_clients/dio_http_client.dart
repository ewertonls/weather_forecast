import 'package:dio/dio.dart';

import '../../../modules/weather/domain/errors/errors.dart';
import '../interfaces/http_client_interface.dart';

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
      throw HttpClientError(e.message, statusCode: e.response?.statusCode);
    }
  }
}
