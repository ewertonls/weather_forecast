abstract class IWeatherDatasource {
  Future<Map<String, dynamic>> getWeather(
    String cityName,
  );
}
