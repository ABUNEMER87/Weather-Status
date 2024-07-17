import 'package:bloc/bloc.dart';
import 'package:waether_app/Services/dio.dart';
import 'package:waether_app/model/weather_model2.dart';
import '../getWeather/get_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitWeather());
  Weather? weather;
  void getWeather({String loc = 'Jordan'}) async {
    //Loading
    emit(Loadweather());
    try {
      weather = await WeatherDio().gethttp(loc: loc);

      //Success
      emit(SuccessWeather());
      print(weather!.location.country);
    } catch (e) {
      //Failuer
      emit(FailuerWeather(error: e.toString()));
    }
  }
}
