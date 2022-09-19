import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_daily_weather_forecast_by_city_name_interface.dart';
import '../events/weather_event.dart';
import '../states/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IGetDailyWeatherForecastByCityName usecase;
  WeatherBloc(this.usecase) : super(const InitialWeatherState()) {
    on<GetWeatherEvent>(getWeather);
  }

  Future<void> getWeather(
    GetWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(LoadingWeatherState());
    final weather = await usecase(event.value);

    weather.fold(
      (error) => emit(ErrorWeatherState(error)),
      (weather) => emit(SuccessWeatherState(weather)),
    );
  }
}
