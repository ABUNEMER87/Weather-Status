import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

class Weather {
  Location location;
  Current current;
  Forecast forecast;

  Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
      );
}

class Current {
  double tempC;
  Condition condition;

  Current({
    required this.tempC,
    required this.condition,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: json["temp_c"]?.toDouble(),
        condition: Condition.fromJson(json["condition"]),
      );

  Map<String, dynamic> toJson() => {
        "temp_c": tempC,
        "condition": condition.toJson(),
      };
}

class Condition {
  String text;
  String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
      };
}

class Forecast {
  List<Forecastday> forecastday;

  Forecast({
    required this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: List<Forecastday>.from(
            json["forecastday"].map((x) => Forecastday.fromJson(x))),
      );
}

class Forecastday {
  DateTime date;
  Day day;
  Forecastday({
    required this.date,
    required this.day,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: DateTime.parse(json["date"]),
        day: Day.fromJson(json["day"]),
      );
}

class Day {
  double avgtempC;

  Condition condition;

  Day({
    required this.avgtempC,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        avgtempC: json["avgtemp_c"]?.toDouble(),
        condition: Condition.fromJson(json["condition"]),
      );
}

class Location {
  String name;
  String region;
  String country;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        localtime: json["localtime"],
      );
}
