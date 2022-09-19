import '../../domain/entities/weather_entity.dart';
import 'forecast_model.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.temperature,
    required super.windSpeed,
    required super.description,
    required super.forecasts,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temperature: map['temperature'],
      windSpeed: map['wind'],
      description: map['description'],
      forecasts: List<Map<String, dynamic>>.from(map['forecast'])
          .map(ForecastModel.fromMap)
          .toList(),
    );
  }
}
