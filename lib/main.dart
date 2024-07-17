import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/getWeather/get_cubit.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
          theme: ThemeData(useMaterial3: true),
        ));
  }
}
