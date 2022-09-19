import '../../../../core/shared/errors/weather_failure_exception_interface.dart';
import '../../domain/entities/weather_entity.dart';

abstract class WeatherState {
  const WeatherState();
}

class InitialWeatherState extends WeatherState {
  const InitialWeatherState();
}

class LoadingWeatherState extends WeatherState {}

class SuccessWeatherState extends WeatherState {
  final Weather weather;
  const SuccessWeatherState(this.weather);
}

class ErrorWeatherState extends WeatherState {
  final IAppException error;
  const ErrorWeatherState(this.error);
}
