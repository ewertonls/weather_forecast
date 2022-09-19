import '../entities/weather_entity.dart';
import '../errors/errors.dart';
import '../repositories/weather_repository_interface.dart';
import 'get_daily_weather_forecast_by_city_name_interface.dart';

class GetDailyWeatherForecastByCityName
    implements IGetDailyWeatherForecastByCityName {
  final IWeatherRepository repository;
  const GetDailyWeatherForecastByCityName(this.repository);

  @override
  Future<Weather> call(String cityName) async {
    if (cityName.trim().isEmpty) {
      throw const InvalidTextError('City name is empty.');
    }
    return repository.getWeather(cityName);
  }
}
