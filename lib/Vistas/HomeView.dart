import 'package:flutter/material.dart';

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
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hola como estamos"),
        ],
      ),
    );
  }
}