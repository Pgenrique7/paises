import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paises/presentation/provider/countries_provider.dart';

class CountriesTextField extends StatelessWidget {
  final TextEditingController controller;

  const CountriesTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);

    return Row(
      children: [
        Expanded(
          child: TextField(
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
          ),
        ),
        // Espacio entre el TextField y el botón
        const SizedBox(width: 8), 
        ElevatedButton(
          onPressed: () {
            final value = controller.text; // Obtiene el texto del TextField
            if (value.isNotEmpty) {
              countryProvider
                  .getCountryFlag(value); // Llama al método del provider
              controller.clear(); // Limpia el campo de texto
            }
          },
          child: const Text('Enviar'), 
        ),
      ],
    );
  }
}
