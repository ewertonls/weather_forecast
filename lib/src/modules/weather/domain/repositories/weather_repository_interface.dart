import '../entities/weather_entity.dart';

abstract class IWeatherRepository {
  Future<Weather> getWeather(String cityName);
}
