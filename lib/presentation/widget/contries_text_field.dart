import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paises/presentation/provider/countries_provider.dart';

class CountriesTextField extends StatelessWidget {
  final TextEditingController controller;

  const CountriesTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);

    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Escribe el nombre del país',
        border: OutlineInputBorder(),
      ),
      onSubmitted: (value) {
        // Llama al método getCountryFlag del provider.
        countryProvider.getCountryFlag(value);
      // Limpia el campo de texto.
        controller.clear(); 
      },
    );
  }
}
