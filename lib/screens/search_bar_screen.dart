import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/cubits/getWeather/get_cubit.dart';

import '../colors.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 70,
            decoration: BoxDecoration(
              color: ktexTColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              onSubmitted: (value) {
                BlocProvider.of<WeatherCubit>(context).getWeather(loc: value);
              },
              controller: searchController,
              cursorColor: kBackGroudColor,
              decoration: const InputDecoration(
                hintText: 'search here...',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        )
      ],
    );
  }
}
