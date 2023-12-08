import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget{
  String sHint ;
  Icon icon;
  bool blIsPassword;
  bool blRelleno;
  TextEditingController tecController = TextEditingController();
  Color colorCaja;
  Color colorTexto;
  Color colorBorde;
  double dPaddingH;
  double dPaddingV;



  TextCustom({Key? key,
    required this.sHint,
    required this.tecController,
    required this.icon,
    this.blIsPassword = false,
    this.blRelleno = true,
    required this.colorCaja,
    required this.colorBorde,
    required this.colorTexto,
    this.dPaddingH = 60,
    this.dPaddingV = 16,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return TextField(
      controller: tecController,
      obscureText: blIsPassword,
      decoration: InputDecoration(
        icon: icon,
        fillColor: colorCaja,
        filled: blRelleno,
        labelText: sHint,
        labelStyle: TextStyle(
          color: colorTexto
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:  colorBorde
          )
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
    );

  }
  
}