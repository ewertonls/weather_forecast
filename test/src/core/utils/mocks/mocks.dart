import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast/src/modules/weather/domain/repositories/weather_repository_interface.dart';
import 'package:weather_forecast/src/modules/weather/domain/usecases/get_daily_weather_forecast_by_city_name_interface.dart';
import 'package:weather_forecast/src/modules/weather/infra/datasources/weather_datasource_interface.dart';

class DioMock extends Mock implements Dio {}

class WeatherRepositoryMock extends Mock implements IWeatherRepository {}

class WeatherDataSourceMock extends Mock implements IWeatherDatasource {}

class GetWeatherByCityNameMock extends Mock
    implements IGetDailyWeatherForecastByCityName {}
