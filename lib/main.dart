import 'package:flutter/material.dart';
import 'package:paises/presentation/screens/countries_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Countries APi',
      home: const CountriesScreen()
    );
  }
}