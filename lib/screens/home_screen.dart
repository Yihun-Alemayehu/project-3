import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_3/weather_bloc/weather_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather app'),
        centerTitle: true,
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Enter the name of the city to search'),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: 'Enter city name here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<WeatherBloc>()
                        ..add(FetchWeatherEvent(city: _controller.text));
                    },
                    child: const Text('Search'),
                  ),
                  if (state is WeatherLoaded)
                    Column(
                      children: [
                        Text(state.cityName),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(state.temperature.toString()),
                        const SizedBox(
                          height: 20,
                        ),
                        // Text(state.description),
                        
                      ],
                    )
                  else if (state is WeatherFailure)
                    Text(
                      'Error: ${state.message}',
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
