import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/modules/weather/domain/errors/errors.dart';
import 'package:weather_forecast/src/modules/weather/domain/usecases/get_daily_weather_forecast_by_city_name_interface.dart';
import 'package:weather_forecast/src/modules/weather/presenter/blocs/weather_bloc.dart';
import 'package:weather_forecast/src/modules/weather/presenter/events/weather_event.dart';
import 'package:weather_forecast/src/modules/weather/presenter/states/weather_state.dart';

class GetWeatherByCityNameMock extends Mock
    implements IGetDailyWeatherForecastByCityName {}

void main() {
  final usecase = GetWeatherByCityNameMock();
  const weather = Weather(
    temperature: '',
    windSpeed: '',
    description: '',
    forecasts: [],
  );
  test('should emit WeatherStates in correct order', () async {
    when(() => usecase.call(any())).thenAnswer((i) async => weather);
    final bloc = WeatherBloc(usecase);
    bloc.add(const GetWeatherEvent('maceio'));
    expect(
      bloc.stream,
      emitsInOrder(
        [
          isA<LoadingWeatherState>(),
          isA<SuccessWeatherState>(),
        ],
      ),
    );
  });
  test('should emit an error state when an invalid text is given', () async {
    when(() => usecase.call(any())).thenThrow(const InvalidTextError(''));
    final bloc = WeatherBloc(usecase);
    bloc.add(const GetWeatherEvent(''));
    expect(
      bloc.stream,
      emitsInOrder(
        [
          isA<LoadingWeatherState>(),
          isA<ErrorWeatherState>(),
        ],
      ),
    );
  });
}
