import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast/src/modules/weather/domain/errors/errors.dart';
import 'package:weather_forecast/src/modules/weather/external/datasources/goweather_datasource.dart';
import 'package:weather_forecast/src/modules/weather/infra/models/weather_model.dart';

import '../../../../utils/goweather_response.dart' as goweather;

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();

  final successResponse = Response(
    requestOptions: RequestOptions(data: {}, path: ''),
    statusCode: 200,
    data: jsonDecode(goweather.successJson),
  );

  final notFoundResponse = Response(
    requestOptions: RequestOptions(data: {}, path: ''),
    statusCode: 200,
    data: jsonDecode(goweather.notFoundJson),
  );

  final emptyResponse = Response(
    requestOptions: RequestOptions(data: {}, path: ''),
    statusCode: 200,
    data: jsonDecode(goweather.emptyJson),
  );

  final datasource = GoWeatherDatasource(dio);
  test('should return a WeatherModel', () async {
    when(() => dio.get(any()))
        .thenAnswer((invocation) async => successResponse);

    final weather = await datasource.getWeather('maceio');

    expect(weather, isA<WeatherModel>());
  });
  test('should throw a DatasourceError when weather forecast is not found',
      () async {
    when(() => dio.get(any()))
        .thenAnswer((invocation) async => notFoundResponse);

    final future = datasource.getWeather('asokdmsdoa');

    expect(future, throwsA(isA<DatasourceError>()));
  });
  test('should throw a DatasourceError when weather forecast values is empty',
      () async {
    when(() => dio.get(any())).thenAnswer((invocation) async => emptyResponse);

    final future = datasource.getWeather('navespacial');

    expect(future, throwsA(isA<DatasourceError>()));
  });
}
