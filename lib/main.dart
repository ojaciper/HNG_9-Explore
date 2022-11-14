import 'package:explore/provider/country_state.dart';
import 'package:explore/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountriesState(),
        )
      ],
      child: const MaterialApp(
        title: "Explore",
        home: HomeScreen(),
      ),
    );
  }
}
