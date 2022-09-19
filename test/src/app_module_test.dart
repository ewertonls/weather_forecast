import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:weather_forecast/src/app_module.dart';
import 'package:weather_forecast/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/modules/weather/domain/usecases/get_daily_weather_forecast_by_city_name_interface.dart';
import 'utils/goweather_response.dart' as goweather;

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  initModule(
    AppModule(),
    replaceBinds: [
      Bind<Dio>((i) => dio),
    ],
  );
  final successResponse = Response(
    requestOptions: RequestOptions(data: {}, path: ''),
    statusCode: 200,
    data: jsonDecode(goweather.successJson),
  );

  test('should get the usecase without error', () async {
    final usecase = Modular.get<IGetDailyWeatherForecastByCityName>();
    expect(usecase, isA<IGetDailyWeatherForecastByCityName>());
  });
  test('should return a Weather object', () async {
    when(() => dio.get(any()))
        .thenAnswer((invocation) async => successResponse);

    final usecase = Modular.get<IGetDailyWeatherForecastByCityName>();
    final result = await usecase('rio de janeiro');

    expect(result, isA<Weather>());
  });
}
