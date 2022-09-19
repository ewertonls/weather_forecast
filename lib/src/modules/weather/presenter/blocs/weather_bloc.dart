import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/errors/weather_failure_exception_interface.dart';
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
    try {
      final weather = await usecase(event.value);
      emit(SuccessWeatherState(weather));
    } on IAppException catch (e) {
      emit(ErrorWeatherState(e));
    }
  }
}
