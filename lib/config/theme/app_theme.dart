import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 98, 8, 244);

const List<Color> _colorthemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor <= _colorthemes.length - 1,

        'colors must be between 0 an ${_colorthemes.length}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorthemes[selectedColor],
      brightness: Brightness.dark,
    );
  }
}
