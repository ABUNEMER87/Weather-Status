import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/model/weather_model2.dart';
import '../cubits/getWeather/get_cubit.dart';
import '../cubits/getWeather/get_state.dart';
import '../screens/error_screen.dart';
import '../screens/loading_screen.dart';
import '../colors.dart';
import '../screens/body_screen.dart';
import '../screens/search_bar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded = true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getWeather(loc: 'Jordan');
  }

  @override
  Widget build(BuildContext context) {
    // Weather weather = BlocProvider.of<WeatherCubit>(context).weather!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackGroudColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackGroudColor,
        title: const Text(
          'Weather Status .. ',
          style: TextStyle(color: ktexTColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SearchBarScreen(),
            const Spacer(),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is Loadweather) {
                  return const LoadingScreen();
                } else if (state is SuccessWeather) {
                  return const BodyScreen();
                } else {
                  return const ErrorScreen();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
