import '../../domain/entities/forecast_entity.dart';

class ForecastMapper {
  const ForecastMapper._();

  static ForecastEntity fromMap(Map<String, dynamic> map) {
    return ForecastEntity(
      day: int.parse(map['day']),
      temperature: map['temperature'],
      windSpeed: map['wind'],
    );
  }
}
