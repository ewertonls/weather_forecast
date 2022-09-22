import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CitySearch extends StatefulWidget {
  const CitySearch({
    super.key,
    required this.action,
    this.defaultCity,
  });

  final void Function(String) action;
  final String? defaultCity;

  @override
  State<CitySearch> createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  final cityController = TextEditingController();

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.defaultCity != null) {
      cityController.text = widget.defaultCity!;
      widget.action.call(widget.defaultCity!);
    }
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  void _search() {
    _turnOffVisibility();
    widget.action.call(cityController.text.trim());
  }

  void _turnOffVisibility() {
    setState(() {
      isVisible = false;
    });
  }

  void _turnOnVisibility() {
    setState(() {
      isVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final text = cityController.text.trim();
    final isEmpty = text.isEmpty;

    if (isVisible) {
      return Container(
        padding: const EdgeInsets.only(left: 8),
        decoration: ShapeDecoration(
          color: colorScheme.secondaryContainer,
          shape: StadiumBorder(
            side: BorderSide(color: colorScheme.primary),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            TextFormField(
              controller: cityController,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSecondaryContainer,
              ),
              decoration: const InputDecoration(
                hintText: 'Search city weather forecast',
                filled: false,
              ),
              onEditingComplete: _search,
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: AspectRatio(
                aspectRatio: 1,
                child: IconButton(
                  onPressed: _search,
                  icon: Icon(
                    CupertinoIcons.search,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return TextButton(
      onPressed: _turnOnVisibility,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              isEmpty ? 'Enter a city' : text,
              style: textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
