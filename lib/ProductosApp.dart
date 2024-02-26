import 'package:flutter/material.dart';

import 'Vistas/RegisterView.dart';

class ProductosApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        '/registerview': (context) => RegisterView(),
      },
      initialRoute: '/registerview',
    );
  }
  
}