import 'package:flutter/material.dart';

import '../FbObjects/FbProducto.dart';


class CeldasPersonalizadas extends StatelessWidget{

  final List<FbProducto> productos;
  final int iPosicion;
  final Function (int indice)? onItemListaClickedFunction;

  const CeldasPersonalizadas({super.key,
    required this.productos,
    required this.iPosicion,
    required this.onItemListaClickedFunction
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      padding: EdgeInsets.all(8.0), // padding around the grid
      itemCount: productos.length, // total number of items
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            color: Colors.lightGreen, // color of grid items
            child: Center(
              child: Text(
                productos[index].nombre,
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
          onTap: () {
            onItemListaClickedFunction!(index);
          },
        );
      },
    );

  }

}