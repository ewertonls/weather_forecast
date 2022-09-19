import 'package:flutter/material.dart';

import '../../domain/entities/forecast_entity.dart';
import 'wind_speed_widget.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key, required this.forecast});
  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final today = DateTime.now();
    final nextDay = today.add(Duration(days: forecast.day));

    return Material(
      color: colorScheme.surfaceVariant,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                weekDay(nextDay.weekday),
                style: textTheme.titleSmall,
              ),
              Text(
                '${month(nextDay.month)} ${nextDay.day}',
                style: textTheme.subtitle2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  forecast.temperature,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              WindSpeed(speed: forecast.windSpeed),
            ],
          ),
        ),
      ),
    );
  }

  String month(int month) {
    final months = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months.elementAt((month - 1) % 12);
  }

  String weekDay(int day) {
    final days = <String>[
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];
    return days[day % 7];
  }
}
