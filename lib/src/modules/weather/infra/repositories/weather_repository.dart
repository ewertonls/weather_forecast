import 'package:dartz/dartz.dart';

import '../../../../core/shared/errors/weather_failure_exception_interface.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/weather_repository_interface.dart';
import '../datasources/weather_datasource_interface.dart';
import '../mappers/weather_mapper.dart';

class WeatherRepository implements IWeatherRepository {
  final IWeatherDatasource _datasource;

  const WeatherRepository(this._datasource);

  @override
  Future<Either<IAppException, WeatherEntity>> getWeather(
    String cityName,
  ) async {
    try {
      final result = await _datasource.getWeather(cityName);
      return Right(WeatherMapper.fromMap(result));
    } on WeatherNotFoundError catch (e) {
      return Left(e);
    } on DatasourceError catch (e) {
      return Left(e);
    }
  }
}
