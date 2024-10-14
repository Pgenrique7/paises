import 'package:flutter/material.dart';
import 'package:paises/presentation/provider/countries_provider.dart';

class CountryDisplay extends StatelessWidget {
  final CountryProvider countryProvider;

  const CountryDisplay({super.key, required this.countryProvider});

  @override
  Widget build(BuildContext context) {
    if (countryProvider.isLoading) {
      return const CircularProgressIndicator(); // Muestra un indicador de carga.
    } else if (countryProvider.country != null) {
      return Column(
        children: [
          Text('País: ${countryProvider.country!.name}'),
          Image.network(countryProvider.country!.flagUrl),
        ],
      );
    } else if (countryProvider.errorMessage != null) {
      return Text(
        countryProvider.errorMessage!,
        style: const TextStyle(color: Colors.red),
      );
    } else {
      return Container(); // Retorna un contenedor vacío si no hay información.
    }
  }
}
