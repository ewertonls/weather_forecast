import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_daily_weather_forecast_by_city_name.dart';
import 'external/datasources/goweather_datasource.dart';
import 'infra/repositories/weather_repository.dart';
import 'presenter/blocs/weather_bloc.dart';

class WeatherModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<Dio>((i) => Dio(), export: true),
        Bind.lazySingleton((i) => GoWeatherDatasource(i()), export: true),
        Bind.lazySingleton((i) => WeatherRepository(i()), export: true),
        Bind.lazySingleton(
          (i) => GetDailyWeatherForecastByCityName(i()),
          export: true,
        ),
        Bind.lazySingleton<WeatherBloc>(
          (i) => WeatherBloc(i()),
          onDispose: (bloc) => bloc.close(),
          export: true,
        ),
      ];
}
