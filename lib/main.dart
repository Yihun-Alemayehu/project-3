import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_3/screens/home_screen.dart';
import 'package:project_3/weather_bloc/weather_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => WeatherBloc(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
