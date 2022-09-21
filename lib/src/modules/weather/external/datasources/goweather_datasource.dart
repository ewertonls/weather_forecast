import '../../../../core/shared/interfaces/http_client_interface.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasources/weather_datasource_interface.dart';

class GoWeatherDatasource implements IWeatherDatasource {
  final IHttpClient _client;
  const GoWeatherDatasource(this._client);

  @override
  Future<Map<String, dynamic>> getWeather(String cityName) async {
    try {
      final response = await _client
          .get('https://goweather.herokuapp.com/weather/$cityName');

      final data = response;

      final dataIsNotFound = data.containsValue('NOT_FOUND');
      final dataIsEmpty = data.values.any((element) => element.isEmpty);

      if (dataIsNotFound || dataIsEmpty) {
        throw const WeatherNotFoundError(
          'Weather forecast not found for city.',
        );
      }

      return data;
    } on HttpClientError catch (e) {
      if (e.statusCode == 404) {
        throw const WeatherNotFoundError(
          'Weather forecast not found for city.',
        );
      }
      throw DatasourceError(e.message);
    }
  }
}
