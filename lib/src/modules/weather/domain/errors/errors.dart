import '../../../../core/shared/errors/weather_failure_exception_interface.dart';

abstract class WeatherFailure extends IAppException {
  const WeatherFailure(super.message, [super.stackTrace]);
}

class InvalidTextError extends WeatherFailure {
  const InvalidTextError(super.message, [super.stackTrace]);
}

class DatasourceError extends WeatherFailure {
  const DatasourceError(super.message, [super.stackTrace]);
}
