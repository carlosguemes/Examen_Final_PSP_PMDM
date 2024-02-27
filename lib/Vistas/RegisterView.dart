import 'package:examen/VistasPersonalizadas/SnackBarMensaje.dart';
import 'package:examen/VistasPersonalizadas/TextEditingPersonalizado.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget{
  TextEditingController correoUsuarioController = TextEditingController();
  TextEditingController contrasenyaUsuarioController = TextEditingController();
  TextEditingController repiteContrasenyaUsuarioController = TextEditingController();

  late BuildContext _context;

  void botonAceptar() async{
    if (contrasenyaUsuarioController.text != repiteContrasenyaUsuarioController.text){
      SnackBarMensaje().muestraSnackBar(_context, "Las contraseñas no coinciden");
    }

    else{
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: correoUsuarioController.text,
          password: contrasenyaUsuarioController.text,
        );
        Navigator.of(_context).popAndPushNamed('/homeview');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e.toString());
        SnackBarMensaje().muestraSnackBar(_context, "No se ha podido conectar con la base de datos");
      }
    }
  }

  void botonCancelar(){

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