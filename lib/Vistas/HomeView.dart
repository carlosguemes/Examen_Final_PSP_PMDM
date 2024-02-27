import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../FbObjects/FbProducto.dart';
import '../VistasPersonalizadas/DrawerPersonalizado.dart';
import 'LoginView.dart';
import 'RegisterView.dart';

class HomeView extends StatefulWidget{
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FbProducto> productos = [];

  void descargarProductos() async{
    CollectionReference<FbProducto> reference = db
        .collection("Productos")
        .withConverter(fromFirestore: FbProducto.fromFirestore,
        toFirestore: (FbProducto post, _) => post.toFirestore());

    QuerySnapshot<FbProducto> querySnap = await reference.get();
    for (int i = 0; i < querySnap.docs.length; i++){
      setState(() {
        productos.add(querySnap.docs[i].data());
      });

    }
  }

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
      for (int i = 0; i < productos.length; i++){
        print(productos.elementAt(i).nombre);
      }
    }
  }
  
  @override
  void initState() {
    descargarProductos();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajustes")),
      drawer: DrawerPersonalizado(onItemTap: eventoDrawerPersonalizado),
    );
  }
}