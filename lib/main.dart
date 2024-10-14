import 'package:flutter/material.dart';
import 'package:paises/presentation/provider/countries_provider.dart';
import 'package:paises/presentation/screens/countries_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Country Flag App',
        home:  CountriesScreen(), 
      ),
    );
  }
}