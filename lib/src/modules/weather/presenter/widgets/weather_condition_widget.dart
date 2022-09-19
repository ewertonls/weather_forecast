import 'package:flutter/material.dart';

import '../../../../core/shared/assets/weather_assets.dart';

class WeatherCondition extends StatefulWidget {
  const WeatherCondition({
    super.key,
    required this.condition,
  });

  final String condition;

  @override
  State<WeatherCondition> createState() => _WeatherConditionState();
}

class _WeatherConditionState extends State<WeatherCondition> {
  late final String image;
  @override
  void initState() {
    super.initState();
    image = selectCondition();
  }

  String selectCondition() {
    final condition = widget.condition.toLowerCase();
    if (condition.contains('partly cloudy')) return WeatherAsset.partlyCloudy;
    if (condition.contains('light rain')) return WeatherAsset.lightRain;
    if (condition.contains('thunder')) return WeatherAsset.raindAndThunder;
    if (condition.contains('sunny')) return WeatherAsset.sunny;
    return WeatherAsset.clear;
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      filterQuality: FilterQuality.medium,
    );
  }
}
