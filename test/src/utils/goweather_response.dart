const successJson = '''
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

const notFoundJson = '''
{
  "message": "NOT_FOUND"
}
''';

const emptyJson = '''
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
