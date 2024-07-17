// Create Model Use in OOP
class WeatherModel {
  String name;
  String country;
  double tempC;
  String text;
  String icon;

  // Normal Constructor
  WeatherModel(
      {required this.name,
      required this.country,
      required this.tempC,
      required this.text,
      required this.icon});

//Factory Constructor
  factory WeatherModel.fromjson(dynamic json) => WeatherModel(
      name: json['location']['name'],
      country: json['location']['country'],
      tempC: json['current']['temp_c'],
      text: json['current']['condition']['text'],
      icon: json['current']['condition']['icon']);

  //Named Constructor
  // WeatherModel.fromjson(dynamic json) {
  //   name = json['location']['name'] as String;
  //   country = json['location']['country'] as String;
  //   tempC = json['current']['temp_c'] as double;
  //   text = json['current']['condition']['text'] as String;
  //   icon = json['current']['condition']['icon'] as String;
  // }
}
