import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogingView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Loging"),
        centerTitle: true,
        shadowColor: Colors.red[300],
        backgroundColor: Colors.deepOrange[100],),
    );
  }

}