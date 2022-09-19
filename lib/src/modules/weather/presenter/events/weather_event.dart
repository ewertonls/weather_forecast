abstract class WeatherEvent {
  const WeatherEvent();
}

class GetWeatherEvent extends WeatherEvent {
  final String value;
  const GetWeatherEvent(this.value);
}
