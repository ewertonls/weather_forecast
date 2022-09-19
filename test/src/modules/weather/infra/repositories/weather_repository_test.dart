import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/modules/weather/domain/errors/errors.dart';
import 'package:weather_forecast/src/modules/weather/infra/repositories/weather_repository.dart';

import '../../../../core/utils/data/goweather_response.dart';
import '../../../../core/utils/mocks/mocks.dart';

void main() {
  final datasource = WeatherDataSourceMock();
  final jsonResponse = jsonDecode(GoWeatherResponse.successJson);
  test('should return a Weather', () async {
    when(() => datasource.getWeather(any()))
        .thenAnswer((i) async => jsonResponse);

    final repository = WeatherRepository(datasource);

    final weather = await repository.getWeather('maceio');
    expect(weather.fold(id, id), isA<WeatherEntity>());
  });
  test('should return a DatasourceError if datasource fail', () async {
    when(() => datasource.getWeather(any()))
        .thenThrow(const DatasourceError(''));

    final repository = WeatherRepository(datasource);
    final result = await repository.getWeather('maceio');

    expect(
      result.fold(id, id),
      isA<DatasourceError>(),
    );
  });
}
