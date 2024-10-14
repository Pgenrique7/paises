//Crea una clase country

class Country {
  final String name;
  final String flagUrl;

  Country({required this.name, required this.flagUrl});

  // Factory para crear un objeto Country desde la respuesta JSON de la API
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      flagUrl: json['flags']['png'],
    );
  }
}