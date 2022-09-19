import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/modules/weather/domain/errors/errors.dart';
import 'package:weather_forecast/src/modules/weather/domain/repositories/weather_repository_interface.dart';
import 'package:weather_forecast/src/modules/weather/domain/usecases/get_daily_weather_forecast_by_city_name.dart';

class WeatherRepositoryMock extends Mock implements IWeatherRepository {}

void main() {
  final repository = WeatherRepositoryMock();
  final usecase = GetDailyWeatherForecastByCityName(repository);
  const weather = Weather(
    temperature: '+30',
    windSpeed: '17 km/h',
    description: 'Partly Cloudy',
    forecasts: [],
  );
  test('should return daily weather forecast by city name', () async {
    when(() => repository.getWeather(any())).thenAnswer((i) async => weather);

    final result = await usecase('maceió');

    expect(result, isA<Weather>());
  });
  test('should throw an InvalidTextError if text is invalid', () async {
    when(() => repository.getWeather(any())).thenAnswer((i) async => weather);

    expect(() async => await usecase(''), throwsA(isA<InvalidTextError>()));
    expect(() async => await usecase(' '), throwsA(isA<InvalidTextError>()));
    expect(() async => await usecase('\t'), throwsA(isA<InvalidTextError>()));
  });
}
