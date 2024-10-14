import 'package:flutter/material.dart';
import 'package:paises/presentation/widget/contries_text_field.dart';
import 'package:paises/presentation/widget/countries_display.dart';
import 'package:provider/provider.dart';
import 'package:paises/presentation/provider/countries_provider.dart';

class CountriesScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca la Bandera de un País'), // Título de la barra de la aplicación.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Widget para el campo de texto
            CountriesTextField(controller: _controller),
            const SizedBox(height: 16),
            // Widget para mostrar la bandera o el mensaje de error
            CountryDisplay(countryProvider: countryProvider),
          ],
        ),
      ),
    );
  }
}
