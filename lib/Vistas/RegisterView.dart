import 'package:examen/VistasPersonalizadas/TextEditingPersonalizado.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget{
  TextEditingController nombreUsuarioController = TextEditingController();
  TextEditingController contrasenyaUsuarioController = TextEditingController();
  TextEditingController repiteContrasenyaUsuarioController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Registro'),
      ),

      body: Column(children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        Text('Identifíquese como nuevo usuario', style: TextStyle(fontSize: 25)),
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),

        TextEditingPersonalizado(
            controlador: nombreUsuarioController,
            texto: 'Introduce tu usuario',
            contrasenya: false
        ),

        TextEditingPersonalizado(
            controlador: contrasenyaUsuarioController,
            texto: 'Introduce tu contraseña',
            contrasenya: true
        ),

        TextEditingPersonalizado(
            controlador: repiteContrasenyaUsuarioController,
            texto: 'Repite tu contraseña',
            contrasenya: true
        ),
        ]

      ),
    );
  }
  
}