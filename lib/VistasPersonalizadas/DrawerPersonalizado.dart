import 'package:flutter/material.dart';

class DrawerPersonalizado extends StatelessWidget{

  Function (int indice)? onItemTap;
  DrawerPersonalizado({Key? key, required this.onItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
                style: TextStyle(color: Colors.white),
                'Header'
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_back_outlined),
            selectedColor: Colors.blue,
            selected: true,
            title: const Text('Apartado 1'),
            onTap: () {
              onItemTap!(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.ad_units),
            title: const Text('Apartado 2'),
            onTap: () {
              onItemTap!(1);
            },
          ),
        ],
      ),
    );
  }

}