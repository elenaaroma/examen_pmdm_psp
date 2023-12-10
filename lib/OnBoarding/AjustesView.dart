import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CustomViews/ButtonCustom.dart';

class AjustesView extends StatelessWidget{

  late BuildContext _context;

  void onClickVolver(){
    Navigator.of(_context).popAndPushNamed("/homeview");
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
        appBar: AppBar(title: Text("Ajustes"),
    centerTitle: true,
    shadowColor: Colors.green[400],
    backgroundColor: Colors.green[200],),
      body:  Padding(padding: EdgeInsets.only(top:20),
        child:
        Column(
          children: [

            ButtonCustom(sText: "Volver", event: onClickVolver, fondo: Colors.green[200] ?? Colors.green, letra: Colors.white, alto: 20, ancho: 30)

          ],
        )
        ,

      )
    );
  }

}