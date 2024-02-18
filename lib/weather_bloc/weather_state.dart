part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();

  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final String cityName;
  final double temperature;
  // final String description;

  const WeatherLoaded({required this.cityName, required this.temperature,});

  @override
  List<Object> get props => [cityName, temperature];
}

class WeatherFailure extends WeatherState {
  final String message;

  const WeatherFailure({required this.message});

  @override
  List<Object> get props => [message];
}
