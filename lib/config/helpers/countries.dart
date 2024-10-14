import 'package:dio/dio.dart';
import 'package:paises/infraestructure/models/countries_models.dart';

class CountryRepository {
  final Dio dio = Dio();
   

  // Método para obtener la bandera de un país desde la API usando Dio
  Future<Country?> getCountryFlag(String countryName) async {
    try {
      final response = await dio.get('https://restcountries.com/v3.1/name/$countryName');

      // Si la respuesta es exitosa y tiene datos, convertimos el JSON en un modelo de Country
      if (response.statusCode == 200 && response.data != null && response.data.isNotEmpty) {
        final countryData = response.data[0];
        return Country.fromJson(countryData);
      } else {
        return null; // Si no hay datos, devolvemos null
      }
    } 
    //El DioException hace que se capturen las expeciones lanzadas por Dio (errores con el servidor...)
    on DioException catch (_) {
      // Si ocurre un error de la API, devolvemos null
      return null;
    }
  }
}