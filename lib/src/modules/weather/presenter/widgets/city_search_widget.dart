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
  final focusNode = FocusNode();

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.defaultCity != null) {
      cityController.text = widget.defaultCity!;
      widget.action.call(widget.defaultCity!);
    }
    focusNode.addListener(_updateVisibility);
  }

  @override
  void dispose() {
    cityController.dispose();
    focusNode.removeListener(_updateVisibility);
    focusNode.dispose();
    super.dispose();
  }

  void _updateVisibility() {
    if (!focusNode.hasFocus) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final text = cityController.text.trim();
    final isEmpty = text.isEmpty;

    if (isVisible) {
      return TextFormField(
        controller: cityController,
        focusNode: focusNode,
        // textAlign: TextAlign.center,
        decoration: const InputDecoration(
          hintText: 'Search city weather forecast',
          filled: true,
        ),
        onEditingComplete: () {
          focusNode.unfocus();
          isVisible = false;
          setState(() {});
          widget.action.call(cityController.text.trim());
        },
      );
    }
    return TextButton(
      onPressed: () {
        isVisible = true;
        focusNode.requestFocus();
        setState(() {});
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isEmpty ? 'Enter a city' : text,
            style: textTheme.titleLarge,
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
