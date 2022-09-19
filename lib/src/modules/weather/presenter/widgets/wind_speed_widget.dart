import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WindSpeed extends StatelessWidget {
  const WindSpeed({
    super.key,
    required this.speed,
  });

  final String speed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(CupertinoIcons.wind),
        const SizedBox(width: 8),
        Text(
          speed,
          style: textTheme.labelLarge,
        ),
      ],
    );
  }
}
