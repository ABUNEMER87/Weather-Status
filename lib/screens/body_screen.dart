import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/colors.dart';
import 'package:waether_app/component/card.dart';
import 'package:waether_app/cubits/getWeather/get_cubit.dart';
import 'package:waether_app/model/weather_model2.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    Weather weather = BlocProvider.of<WeatherCubit>(context).weather!;
    // IconData weatherIcons = Icon(weather.current.condition.icon);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              Icons.location_pin,
              color: ktexTColor,
              size: 45,
            ),
            const SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weather.location.name,
                  style: const TextStyle(fontSize: 26, color: ktexTColor),
                ),
                Text(
                  weather.location.country,
                  style: const TextStyle(color: ktexTColor, fontSize: 19),
                ),
                Text(
                  weather.location.localtime,
                  style: const TextStyle(color: ktexTColor, fontSize: 19),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  weather.current.condition.text,
                  style: const TextStyle(color: ktexTColor, fontSize: 26),
                ),
                Text(
                  weather.current.tempC.toString(),
                  style: const TextStyle(color: ktexTColor, fontSize: 35),
                ),
              ],
            ),
            const SizedBox(width: 45),
            Image.network(
              'https:${weather.current.condition.icon}',
              width: 60,
              height: 60,
              color: ktexTColor,
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            CardScreen(index: 1),
            CardScreen(index: 2),
            CardScreen(index: 3),
          ],
        )
      ],
    );
  }
}
