import 'forecast_entity.dart';

class WeatherEntity {
  final String temperature;
  final String windSpeed;
  final String description;
  final List<ForecastEntity> forecasts;
  const WeatherEntity({
    required this.temperature,
    required this.windSpeed,
    required this.description,
    required this.forecasts,
  });
}
