// import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

import 'domain/usecases/get_daily_weather_forecast_by_city_name.dart';
import 'external/datasources/goweather_datasource.dart';
// import 'external/http_clients/dio_http_client.dart';
import 'external/http_clients/uno_http_client.dart';
import 'infra/repositories/weather_repository.dart';
import 'presenter/blocs/weather_bloc.dart';
import 'presenter/pages/home_page.dart';

class WeatherModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Bind.factory<Dio>((i) => Dio()),
        // Bind.factory((i) => DioHttpClient(i())),
        Bind.factory((i) => Uno()),
        Bind.factory((i) => UnoHttpClient(i())),
        Bind.factory((i) => GoWeatherDatasource(i())),
        Bind.factory((i) => WeatherRepository(i())),
        Bind.lazySingleton(
          (i) => GetDailyWeatherForecastByCityNameUsecase(i()),
        ),
        Bind.lazySingleton<WeatherBloc>(
          (i) => WeatherBloc(i()),
          onDispose: (bloc) => bloc.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomePage(
            bloc: Modular.get<WeatherBloc>(),
          ),
        ),
      ];
}
