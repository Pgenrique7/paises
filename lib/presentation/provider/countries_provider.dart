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
    if (countryName.isEmpty) return; // Si el nombre del país está vacío, no se hace nada.

    // Establecer el estado de carga antes de realizar la solicitud.
    isLoading = true;
    errorMessage = null; 
    country = null; 
    notifyListeners(); 

    // Realizar la solicitud para obtener el país
    final result = await countryRepository.getCountryFlag(countryName);

/* El programa tiene un error, ya que si no escribes el nombre de un pais existente se queda parado, y 
creo que el error esta en este condicion*/
   
    //if (result.name.isNotEmpty && result.flagUrl.isNotEmpty) {
      country = result; 
      errorMessage = null;
    /*} else {

      errorMessage = 'Error: No se encontró el país o los datos son incorrectos.';
    }*/

    isLoading = false; // Termina el estado de carga.
    notifyListeners(); // Notifica a los listeners que el estado ha cambiado.
  }
}
