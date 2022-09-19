import 'package:dartz/dartz.dart';

import '../../../../core/shared/errors/weather_failure_exception_interface.dart';
import '../entities/weather_entity.dart';
import '../errors/errors.dart';
import '../repositories/weather_repository_interface.dart';
import 'get_daily_weather_forecast_by_city_name_interface.dart';

class GetDailyWeatherForecastByCityNameUsecase
    implements IGetDailyWeatherForecastByCityName {
  final IWeatherRepository _repository;
  const GetDailyWeatherForecastByCityNameUsecase(this._repository);

  @override
  Future<Either<IAppException, WeatherEntity>> call(String cityName) async {
    if (cityName.trim().isEmpty) {
      return const Left(InvalidTextError('City name is empty.'));
    }
    final weather = await _repository.getWeather(cityName);
    return weather;
  }
}
