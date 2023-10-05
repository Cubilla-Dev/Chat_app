import 'package:flutter/material.dart';

//0xFF se pone para pasarle los valores del color y para que lo tome
const Color _customColor = Color(0xFF49149F);
const List<Color> _colorTheme = [
  _customColor,
  Colors.yellow,
  Colors.orange,
  Colors.red,
  Colors.teal,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length - 1,
            'Colors must be between 0 and ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor],
      //modo oscuro
      // brightness: Brightness.dark
    );
  }
}
