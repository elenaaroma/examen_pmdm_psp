import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget{

  final String sText;
  final Function? event;

  const ButtonCustom({super.key,
    required this.sText,
    this.event,
  });


  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => event!(), child: Text(sText));
  }
}