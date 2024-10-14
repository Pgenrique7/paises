import 'package:flutter/material.dart';
import 'package:paises/config/helpers/countries.dart';
import 'package:paises/infraestructure/models/countries_models.dart';

class CountryProvider extends ChangeNotifier {
  final CountryRepository countryRepository = CountryRepository();

  Country? country; 
  bool isLoading = false; // Indicador de carga.
  String? errorMessage; 

  // Método para obtener la bandera de un país y actualizar el estado.
  Future<void> getCountryFlag(String countryName) async {
    if (countryName.isEmpty) {
      errorMessage = 'El nombre del país no puede estar vacío.';
      notifyListeners();
      return;
    }

    // Establecer el estado de carga antes de realizar la solicitud.
    isLoading = true;

    errorMessage = null; 
    country = null; 
    notifyListeners();

    // Realizar la solicitud para obtener el país
    final result = await countryRepository.getCountryFlag(countryName);

    // Validamos si el resultado es nulo (error o país no encontrado)

      country = result;
      errorMessage = null;

       if (country == null) {
      errorMessage = 'Error: No se encontró el país o hubo un problema con la API.';
    }


    isLoading = false; // Termina el estado de carga.
    notifyListeners(); // Notifica a los listeners que el estado ha cambiado.
  }
}
