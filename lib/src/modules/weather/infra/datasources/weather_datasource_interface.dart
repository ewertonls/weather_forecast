import '../models/weather_model.dart';

abstract class IWeatherDatasource {
  Future<WeatherModel> getWeather(String cityName);
}
