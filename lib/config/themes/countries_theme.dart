import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

List <Color> _colorThemes = [ 
  _customColor,
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
];

class CountriesTheme {

CountriesTheme({this.selectedColor =0}) : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,"Color index must be beetwen 0 and ${_colorThemes.length}");
final int selectedColor;


  ThemeData theme(){
    return ThemeData(
      useMaterial3: false,
      colorSchemeSeed: _colorThemes[selectedColor]
    );

  }
}