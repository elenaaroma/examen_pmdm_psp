import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_pmdm/CustomViews/ButtonCustom.dart';
import 'package:examen_pmdm/CustomViews/TextCustom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../FirestoreObjects/FbUsuario.dart';


class LogingView extends StatelessWidget{

  late BuildContext _context;

  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  throwSnackBar(String error){
    SnackBar snackBar = SnackBar(
      content: Text(error),
    );
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }

  Future<void> onClickAceptar() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text
      );
      Navigator.of(_context).popAndPushNamed('/homeview');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print(' --> Formato del email incorrecto.');
        throwSnackBar('-- Formato del email incorrecto --');
      } else if (e.code == 'invalid-login-credentials') {
        print(' --> Credenciales incorrectas.');
        throwSnackBar('-- Credenciales incorrectas --');
      }
    }
  }

  void OnClickRegistrar() {
    Navigator.of(_context).popAndPushNamed("/registergview");
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
      appBar: AppBar(title: Text("Login"),
        centerTitle: true,
        shadowColor: Colors.green[400],
        backgroundColor: Colors.green[200],),
      body:

        Padding(padding: EdgeInsets.only(top:20),
          child:
            Column(
              children: [
                TextCustom(tecController: usernameController, icon: Icon(Icons.account_circle) , sHint: 'Escribe el usuario', colorCaja: Colors.green[200] ?? Colors.green, colorTexto: Colors.white, colorBorde: Colors.green[400] ?? Colors.green,),
                TextCustom(tecController: passwordController, icon: Icon(Icons.lock_outline) , sHint: 'Escribe la contraseña', colorCaja: Colors.green[200] ?? Colors.green, colorTexto: Colors.white, colorBorde: Colors.green[400] ?? Colors.green, blIsPassword: true,),

                ButtonCustom(sText: "Aceptar", event: onClickAceptar, fondo: Colors.green[200] ?? Colors.green, letra: Colors.white, alto: 20, ancho: 30),
                ButtonCustom(sText: "Registrar", event: OnClickRegistrar, fondo: Colors.green[200] ?? Colors.green, letra: Colors.white, alto: 20, ancho: 30)

              ],
            )
          ,

        )
      ,
    );
  }

}



