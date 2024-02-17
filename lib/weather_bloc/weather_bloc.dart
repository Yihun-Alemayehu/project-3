import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_3/constants/my_api.dart';
import 'package:http/http.dart';

part 'weather_event.dart';
part 'weather_state.dart';

final http = Client();

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      try {
        final response = await http.get(Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=${event.city}&appid=$API_KEY'));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final cityName = data["name"];
          final temp = data["main"]["temp"].toDouble();
          emit(WeatherLoaded(cityName: cityName, temperature: temp));
        }
      } catch (e) {
        emit(const WeatherFailure(message: 'Failed to fetch weather data ..!'));
      }
    });
  }
}
