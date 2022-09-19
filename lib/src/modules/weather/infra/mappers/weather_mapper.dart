import '../../domain/entities/weather_entity.dart';
import 'forecast_mapper.dart';

class WeatherMapper {
  const WeatherMapper._();

  static WeatherEntity fromMap(Map<String, dynamic> map) {
    return WeatherEntity(
      temperature: map['temperature'],
      windSpeed: map['wind'],
      description: map['description'],
      forecasts: List<Map<String, dynamic>>.from(map['forecast'])
          .map(ForecastMapper.fromMap)
          .toList(),
    );
  }
}
