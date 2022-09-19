abstract class WeatherEvent {
  final String value;
  const WeatherEvent(this.value);
}

class GetWeatherEvent extends WeatherEvent {
  const GetWeatherEvent(super.value);
}
