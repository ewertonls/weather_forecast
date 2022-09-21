import 'package:uno/uno.dart';

import '../../../../core/shared/interfaces/http_client_interface.dart';
import '../../domain/errors/errors.dart';

class UnoHttpClient implements IHttpClient {
  final Uno _uno;
  const UnoHttpClient(this._uno);

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await _uno.get(url);
      final data = response.data;
      return data;
    } on UnoError catch (e) {
      throw HttpClientError(e.message, statusCode: e.response?.status);
    }
  }
}
