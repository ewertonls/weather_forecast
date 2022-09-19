import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/modules/weather/domain/errors/errors.dart';
import 'package:weather_forecast/src/modules/weather/presenter/blocs/weather_bloc.dart';
import 'package:weather_forecast/src/modules/weather/presenter/events/weather_event.dart';
import 'package:weather_forecast/src/modules/weather/presenter/states/weather_state.dart';

import '../../../../core/utils/mocks/mocks.dart';

void main() {
  final usecase = GetWeatherByCityNameMock();
  const weather = WeatherEntity(
    temperature: '',
    windSpeed: '',
    description: '',
    forecasts: [],
  );
  test('should emit WeatherStates in correct order', () async {
    when(() => usecase.call(any()))
        .thenAnswer((i) async => const Right(weather));
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
    when(() => usecase.call(any()))
        .thenAnswer((i) async => const Left(InvalidTextError('')));
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
