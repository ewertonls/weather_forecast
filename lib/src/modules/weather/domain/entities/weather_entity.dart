import 'forecast_entity.dart';

class Weather {
  final String temperature;
  final String windSpeed;
  final String description;
  final List<Forecast> forecasts;
  const Weather({
    required this.temperature,
    required this.windSpeed,
    required this.description,
    required this.forecasts,
  });
}
