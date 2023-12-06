import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistroView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro"),
        centerTitle: true,
        shadowColor: Colors.red[300],
        backgroundColor: Colors.deepOrange[100],),
    );
  }

}