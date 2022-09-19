import 'package:dartz/dartz.dart';

import '../../../../core/shared/errors/weather_failure_exception_interface.dart';
import '../entities/weather_entity.dart';

abstract class IWeatherRepository {
  Future<Either<IAppException, WeatherEntity>> getWeather(String cityName);
}
