import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather_bloc.dart';
import '../events/weather_event.dart';
import '../states/weather_state.dart';
import '../widgets/city_search_widget.dart';
import '../widgets/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.bloc});

  final WeatherBloc bloc;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final weatherBloc = widget.bloc;

  final cityController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  Future<void> search(String city) async {
    weatherBloc.add(GetWeatherEvent(city));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: CitySearch(
            action: search,
            defaultCity: 'Maceió',
          ),
        ),
      ),
      body: Center(
        child: BlocBuilder(
          bloc: weatherBloc,
          builder: (context, state) {
            if (state is ErrorWeatherState) {
              return Text(state.error.message);
            }
            if (state is LoadingWeatherState) {
              return const CircularProgressIndicator.adaptive();
            }
            if (state is InitialWeatherState) {
              return const SizedBox();
            }
            final successState = state as SuccessWeatherState;
            final weather = successState.weather;
            return ListView(
              children: [
                WeatherWidget(weather: weather),
              ],
            );
          },
        ),
      ),
    );
  }
}
