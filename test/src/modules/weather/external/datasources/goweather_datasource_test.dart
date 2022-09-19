import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast/src/modules/weather/domain/errors/errors.dart';
import 'package:weather_forecast/src/modules/weather/external/datasources/goweather_datasource.dart';
import 'package:weather_forecast/src/modules/weather/external/http_clients/dio_http_client.dart';

import '../../../../core/utils/data/goweather_response.dart';
import '../../../../core/utils/mocks/mocks.dart';

void main() {
  final dio = DioMock();
  final client = DioHttpClient(dio);
  final datasource = GoWeatherDatasource(client);

  test('should return a WeatherModel', () async {
    when(() => dio.get(any())).thenAnswer(
      (invocation) async => GoWeatherResponse.successResponse,
    );

    final weather = await datasource.getWeather('maceio');

    expect(weather, isA<Map<String, dynamic>>());
  });
  test('should throw a WeatherNotFoundError when weather forecast is not found',
      () async {
    when(() => dio.get(any())).thenAnswer(
      (invocation) async => GoWeatherResponse.notFoundResponse,
    );

    final future = datasource.getWeather('asokdmsdoa');

    expect(future, throwsA(isA<WeatherNotFoundError>()));
  });
  test(
      'should throw a WeatherNotFoundError when weather forecast values is empty',
      () async {
    when(() => dio.get(any())).thenAnswer(
      (invocation) async => GoWeatherResponse.emptyResponse,
    );

    final future = datasource.getWeather('navespacial');

    expect(future, throwsA(isA<WeatherNotFoundError>()));
  });
}
