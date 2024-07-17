import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/colors.dart';
import '../cubits/getWeather/get_cubit.dart';
import '../model/weather_model2.dart';

// ignore: must_be_immutable
class CardScreen extends StatefulWidget {
  int index;
  CardScreen({required this.index, super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    Weather weather = BlocProvider.of<WeatherCubit>(context).weather!;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: ktexTColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text(
                DateFormat('E -d').format(DateTime.parse(weather
                    .forecast.forecastday[widget.index].date
                    .toString())),
                style: const TextStyle(color: ktexTColor, fontSize: 18),
              ),
              const SizedBox(height: 18),
              Text(
                weather.forecast.forecastday[widget.index].day.condition.text,
                style: const TextStyle(color: ktexTColor, fontSize: 18),
              ),
              const SizedBox(height: 18),
              Image.network(
                'https:${weather.current.condition.icon}', // Adjust the URL as needed
                width: 60,
                height: 60,
                color: ktexTColor,
              ),
              const SizedBox(height: 18),
              Text(
                weather.forecast.forecastday[widget.index].day.avgtempC
                    .toString(),
                style: const TextStyle(color: ktexTColor, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
