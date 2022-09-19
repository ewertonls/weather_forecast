import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/modules/weather/domain/errors/errors.dart';
import 'package:weather_forecast/src/modules/weather/infra/datasources/weather_datasource_interface.dart';
import 'package:weather_forecast/src/modules/weather/infra/models/weather_model.dart';
import 'package:weather_forecast/src/modules/weather/infra/repositories/weather_repository.dart';

class WeatherDataSourceMock extends Mock implements IWeatherDatasource {}

void main() {
  final datasource = WeatherDataSourceMock();
  const weatherModel = WeatherModel(
    temperature: '+30',
    windSpeed: '17 km/h',
    description: 'Partly Cloudy',
    forecasts: [],
  );
  test('should return a Weather', () async {
    when(() => datasource.getWeather(any()))
        .thenAnswer((i) async => weatherModel);

    final repository = WeatherRepository(datasource);

    final weather = await repository.getWeather('maceio');
    expect(weather, isA<Weather>());
  });
  test('should return a DatasourceError if datasource fail', () async {
    when(() => datasource.getWeather(any())).thenThrow(Exception());

    final repository = WeatherRepository(datasource);

    expect(
      () async => await repository.getWeather('maceio'),
      throwsA(isA<DatasourceError>()),
    );
  });
}
