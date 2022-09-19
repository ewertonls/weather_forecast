import 'package:dartz/dartz.dart' show id;
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:weather_forecast/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/modules/weather/domain/usecases/get_daily_weather_forecast_by_city_name_interface.dart';
import 'package:weather_forecast/src/modules/weather/weather_module.dart';
import 'core/utils/data/goweather_response.dart';
import 'core/utils/mocks/mocks.dart';

void main() {
  final dio = DioMock();
  initModule(
    WeatherModule(),
    replaceBinds: [
      Bind<Dio>((i) => dio),
    ],
  );

  test('should get the usecase without error', () async {
    final usecase = Modular.get<IGetDailyWeatherForecastByCityName>();
    expect(usecase, isA<IGetDailyWeatherForecastByCityName>());
  });
  test('should return a Weather object', () async {
    when(() => dio.get(any()))
        .thenAnswer((i) async => GoWeatherResponse.successResponse);

    final usecase = Modular.get<IGetDailyWeatherForecastByCityName>();
    final result = await usecase('rio de janeiro');

    expect(result.fold(id, id), isA<WeatherEntity>());
  });
}
