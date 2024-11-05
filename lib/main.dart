import 'package:flutter/material.dart';
import 'package:milesedu/homescreen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Miles Education',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.black,
            iconTheme: IconThemeData(color: Colors.white), // Set icons to white
            actionsIconTheme: IconThemeData(color: Colors.white),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const HomeScreen());
  }
}
