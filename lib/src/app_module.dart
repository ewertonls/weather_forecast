import 'package:flutter_modular/flutter_modular.dart';

import 'modules/weather/presenter/blocs/weather_bloc.dart';
import 'modules/weather/presenter/pages/home_page.dart';
import 'modules/weather/weather_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        WeatherModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomePage(
            bloc: Modular.get<WeatherBloc>(),
          ),
        ),
      ];
}
