import 'package:examen/VistasPersonalizadas/TextEditingPersonalizado.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget{
  TextEditingController correoUsuarioController = TextEditingController();
  TextEditingController contrasenyaUsuarioController = TextEditingController();
  TextEditingController repiteContrasenyaUsuarioController = TextEditingController();

  late BuildContext _context;

  void botonAceptar(){
    if (contrasenyaUsuarioController.text != repiteContrasenyaUsuarioController.text){
      SnackBar snackBar = SnackBar(
        content: Text("Las contraseñas no coinciden"),
      );
      ScaffoldMessenger.of(_context).showSnackBar(snackBar);
    }
  }



  @override
  Widget build(BuildContext context) {
    _context = context;
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
            controlador: correoUsuarioController,
            texto: 'Introduce tu correo',
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

        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 10),
            child: TextButton(onPressed: botonAceptar,
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                child: Text("Aceptar")),),

          Padding(padding: EdgeInsets.symmetric(vertical: 10),
            child: TextButton(onPressed: null,
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                child: Text("Cancelar")),)
        ],)
        ]),
    );
  }
  
}