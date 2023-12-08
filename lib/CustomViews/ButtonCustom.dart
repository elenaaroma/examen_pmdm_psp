
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget{

  final String sText;
  final Function? event;
  final Color fondo;
  final Color letra;
  final double alto;
  final double ancho;

  const ButtonCustom({super.key,
    required this.sText,
    required this.event,
    required this.fondo,
    required this.letra,
    required this.alto,
    required this.ancho,
  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () => event!(),
      style: ElevatedButton.styleFrom(
        primary: fondo, // Color de fondo personalizado
        onPrimary: letra, // Color de texto personalizado
        padding: EdgeInsets.symmetric(horizontal: ancho, vertical: alto),
      ),
      child: Text(sText),
    );
  }
}