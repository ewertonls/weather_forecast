import '../../domain/entities/forecast_entity.dart';

class ForecastModel extends Forecast {
  ForecastModel({
    required super.day,
    required super.temperature,
    required super.windSpeed,
  });

  factory ForecastModel.fromMap(Map<String, dynamic> map) {
    return ForecastModel(
      day: int.parse(map['day']),
      temperature: map['temperature'],
      windSpeed: map['wind'],
    );
  }
}
