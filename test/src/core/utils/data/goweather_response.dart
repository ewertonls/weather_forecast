import 'dart:convert';

import 'package:dio/dio.dart';

class GoWeatherResponse {
  const GoWeatherResponse._();

  static const successJson = _successJson;
  static const notFoundJson = _notFoundJson;
  static const emptyJson = _emptyJson;

  static final successResponse = Response(
    requestOptions: RequestOptions(data: {}, path: ''),
    statusCode: 200,
    data: jsonDecode(successJson),
  );

  static final notFoundResponse = Response(
    requestOptions: RequestOptions(data: {}, path: ''),
    statusCode: 200,
    data: jsonDecode(notFoundJson),
  );

  static final emptyResponse = Response(
    requestOptions: RequestOptions(data: {}, path: ''),
    statusCode: 200,
    data: jsonDecode(emptyJson),
  );
}

const _successJson = '''
{
  "temperature":"+28 °C",
  "wind":"17 km/h",
  "description":"Partly cloudy",
  "forecast":[
    {
      "day":"1",
      "temperature":"+28 °C",
      "wind":"14 km/h"
    },
    {
      "day":"2",
      "temperature":"+29 °C",
      "wind":"19 km/h"
    },
    {
      "day":"3",
      "temperature":"28 °C",
      "wind":"17 km/h"
    }
  ]
}
''';

const _notFoundJson = '''
{
  "message": "NOT_FOUND"
}
''';

const _emptyJson = '''
{
  "temperature":"",
  "wind":"",
  "description":"",
  "forecast": [
    {
      "day":"",
      "temperature":"",
      "wind":""
    },
    {
      "day":"",
      "temperature":"",
      "wind":""
    },
    {
      "day":"",
      "temperature":"",
      "wind":""
    }
  ]
}
''';
