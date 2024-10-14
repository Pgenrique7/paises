import 'package:dio/dio.dart';
import 'package:paises/infraestructure/models/countries_models.dart';

class CountryRepository{
  final Dio dio = Dio();

  // Método para obtener la bandera de un país desde la API usando Dio
  Future<Country> getCountryFlag(String countryName) async {
    final response = await dio.get('https://restcountries.com/v3.1/name/$countryName');

    // Verificamos si la respuesta es exitosa
    if (response.statusCode == 200) {
      final countryData = response.data;

      // Convertimos la respuesta en un modelo de Country
      final country = Country.fromJson(countryData[0]);
      return country;
    }

    // Si la respuesta no es exitosa, lanzamos un error
    throw UnimplementedError('Error al obtener la bandera del país.');
  }
}