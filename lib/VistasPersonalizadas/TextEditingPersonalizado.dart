import 'package:flutter/material.dart';

class TextEditingPersonalizado extends StatelessWidget{
  static const double paddingVertical = 5;

  TextEditingController controlador;
  String texto;
  bool contrasenya;

  TextEditingPersonalizado({
    required this.controlador,
    required this.texto,
    required this.contrasenya
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Checkbox.width,
          vertical: paddingVertical),
      child: Flexible(
        child: TextFormField(
          controller: controlador,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: texto,
            fillColor: Colors.white,
            filled: true,
          ),
          obscureText: contrasenya,
        ),
      ),
    );
  }
}