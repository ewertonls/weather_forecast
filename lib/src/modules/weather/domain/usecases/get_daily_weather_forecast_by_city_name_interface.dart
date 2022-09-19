import '../entities/weather_entity.dart';

abstract class IGetDailyWeatherForecastByCityName {
  Future<Weather> call(String cityName);
}
