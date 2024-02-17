import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather app'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Enter the name of the city to search'),
            const SizedBox(height: 30,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter city name here...',
                border: OutlineInputBorder(             
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),

          ],
        ),
      ),
    );
  }
}