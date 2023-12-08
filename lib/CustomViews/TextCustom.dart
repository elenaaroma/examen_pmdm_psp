import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget{
  String sHint ;
  Icon icon;
  bool blIsPassword;
  TextEditingController tecController = TextEditingController();
  double dPaddingH;
  double dPaddingV;



  TextCustom({Key? key,
    required this.sHint,
    required this.tecController,
    required this.icon,
    this.blIsPassword = false,
    this.dPaddingH = 60,
    this.dPaddingV = 16,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return TextField(
      decoration: InputDecoration(
        icon: icon,
        hintText: sHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
    );

  }
  
}