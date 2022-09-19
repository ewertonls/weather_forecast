import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/modules/weather/domain/errors/errors.dart';
import 'package:weather_forecast/src/modules/weather/domain/usecases/get_daily_weather_forecast_by_city_name.dart';

import '../../../../core/utils/mocks/mocks.dart';

void main() {
  final repository = WeatherRepositoryMock();
  final usecase = GetDailyWeatherForecastByCityNameUsecase(repository);
  const weather = WeatherEntity(
    temperature: '+30',
    windSpeed: '17 km/h',
    description: 'Partly Cloudy',
    forecasts: [],
  );
  test('should return daily weather forecast by city name', () async {
    when(() => repository.getWeather(any()))
        .thenAnswer((i) async => const Right(weather));

    final result = await usecase('maceió');

    expect(result.fold(id, id), isA<WeatherEntity>());
  });
  test('should throw an InvalidTextError if text is invalid', () async {
    when(() => repository.getWeather(any()))
        .thenAnswer((i) async => const Right(weather));

    final emptyString = await usecase('');
    final spaceString = await usecase(' ');
    final tabString = await usecase('\t');

    expect(emptyString.fold(id, id), isA<InvalidTextError>());
    expect(spaceString.fold(id, id), isA<InvalidTextError>());
    expect(tabString.fold(id, id), isA<InvalidTextError>());
  });
}
