import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../VistasPersonalizadas/DrawerPersonalizado.dart';
import 'LoginView.dart';
import 'RegisterView.dart';

class HomeView extends StatefulWidget{
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool esLista = false;
  void onBottomMenuPressed(int indice) {
    setState(() {
      if (indice == 0){
        esLista = true;
      }
      else if (indice == 1){
        esLista = false;
      }
    });
  }

  void eventoDrawerPersonalizado(int indice){
    if (indice == 0){
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil (
        MaterialPageRoute (builder: (BuildContext context) => LoginView()),
        ModalRoute.withName('/loginview'),
      );
    }

    else if (indice == 1){
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil (
        MaterialPageRoute (builder: (BuildContext context) => RegisterView()),
        ModalRoute.withName('/registerview'),
      );
    }
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajustes")),
      drawer: DrawerPersonalizado(onItemTap: eventoDrawerPersonalizado),
    );
  }
}