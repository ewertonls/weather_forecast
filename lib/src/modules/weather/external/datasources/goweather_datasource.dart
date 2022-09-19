import 'package:dio/dio.dart';

import '../../domain/errors/errors.dart';
import '../../infra/datasources/weather_datasource_interface.dart';
import '../../infra/models/weather_model.dart';

class GoWeatherDatasource implements IWeatherDatasource {
  final Dio dio;
  const GoWeatherDatasource(this.dio);

  @override
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final response =
          await dio.get('https://goweather.herokuapp.com/weather/$cityName');
      final data = response.data;

      if (data == null) {
        throw const DatasourceError('Empty response.');
      }

      if (data is Map &&
          (data.containsValue('NOT_FOUND') ||
              data.values.any((element) => element.isEmpty))) {
        throw const DatasourceError(
          'Weather forecast not found for this city.',
        );
      }

      final weather = WeatherModel.fromMap(data);
      return weather;
    } on DioError catch (e, s) {
      throw DatasourceError(e.message, s);
    }
  }
}
