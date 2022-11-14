import 'package:explore/provider/country_state.dart';
import 'package:explore/provider/dark_theme_provider.dart';
import 'package:explore/screens/home_screen.dart';
import 'package:explore/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountriesState(),
        ),
        ChangeNotifierProvider(
          create: (context) => DarkThemeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(
          context.watch<DarkThemeProvider>().darkTheme, context),
      title: "Explore",
      home: const HomeScreen(),
    );
  }
}
