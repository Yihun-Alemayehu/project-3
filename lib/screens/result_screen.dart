// weather_result_screen.dart

import 'package:flutter/material.dart';
import 'package:project_3/weather_bloc/weather_bloc.dart';

class WeatherResultScreen extends StatelessWidget {
  WeatherState state;

  WeatherResultScreen({required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Result'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (state is WeatherLoaded)
                Column(
                  children: [
                    Text('City: ${state}'),
                    const SizedBox(
                      height: 20,
                    ),
                    // Text('Temperature: ${state.temperature}°C'),
                    const SizedBox(
                      height: 20,
                    ),
                    // Text('Description: ${weatherState.description}'),
                  ],
                )
              else if (state is WeatherFailure)
                // Text(
                  // 'Error: ${state.message}',
                  // style: TextStyle(color: Colors.red),
                // ),
            ],
          ),
        ),
      ),
    );
  }
}
