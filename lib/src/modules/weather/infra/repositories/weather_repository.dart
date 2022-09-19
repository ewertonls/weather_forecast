import '../../domain/entities/weather_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/weather_repository_interface.dart';
import '../datasources/weather_datasource_interface.dart';

class WeatherRepository implements IWeatherRepository {
  final IWeatherDatasource datasource;

  const WeatherRepository(this.datasource);

  @override
  Future<Weather> getWeather(String cityName) async {
    try {
      final result = await datasource.getWeather(cityName);
      final weather = result;
      return weather;
    } on DatasourceError catch (e, s) {
      throw DatasourceError(e.message, s);
    } catch (e, s) {
      throw DatasourceError('An error occurred fetching data', s);
    }
  }
}
