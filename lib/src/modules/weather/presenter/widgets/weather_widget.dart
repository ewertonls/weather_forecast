import 'package:flutter/material.dart';

import '../../domain/entities/weather_entity.dart';
import 'forecast_widget.dart';
import 'weather_condition_widget.dart';
import 'wind_speed_widget.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key, required this.weather});

  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: 250),
          child: WeatherCondition(condition: weather.description),
        ),
        Text(
          weather.temperature,
          style: textTheme.displayLarge,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 28),
        Text(
          weather.description,
          style: textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        WindSpeed(speed: weather.windSpeed),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: weather.forecasts
                  .map(
                    (forecast) => ForecastWidget(forecast: forecast),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
