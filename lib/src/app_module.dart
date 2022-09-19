import 'package:flutter_modular/flutter_modular.dart';

import 'modules/weather/weather_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [ModuleRoute('/', module: WeatherModule())];
}
