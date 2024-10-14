//Crea una clase country
//No he sabido arreglar el problema de las traducciones.
class Country {
  final String name;
  final String flagUrl;
  final String capital;

  Country({
    required this.name, 
    required this.flagUrl, 
    required this.capital,
    });

  // Factory para crear un objeto Country desde la respuesta JSON de la API
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      flagUrl: json['flags']['png'],
      //En capital ponemos un ternario por si la API devuelve que no hay capitall (null) ponga no disponible
      capital: json['capital'] != null ? json['capital'][0] : 'No disponible', 
    );
  }
}

