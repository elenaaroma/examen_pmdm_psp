import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CustomViews/ButtonCustom.dart';
import '../CustomViews/TextCustom.dart';

class RegistroView extends StatelessWidget{

  late BuildContext _context;

  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController passwordRepeatController=TextEditingController();

  throwSnackBar(String error){
    SnackBar snackBar = SnackBar(
      content: Text(error),
    );
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }

  void onClickCancelar(){
    Navigator.of(_context).pushNamed("/loginview");
  }
  void onClickAceptar() async {

    if(passwordController.text==passwordRepeatController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );

        Navigator.of(_context).pushNamed("/perfilview");

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('La contraseña es muy debil');
          throwSnackBar('La contraseña es muy debil');
        } else if (e.code == 'email-already-in-use') {
          print('Este email ya esta en uso');
          throwSnackBar('Este email ya esta en uso');
        }
      } catch (e) {
        print(e);
      }
    }
    else{
      throwSnackBar('Las contraseñas no son iguales');
    }
  }

  void onClickVolver(){
    Navigator.of(_context).popAndPushNamed("/loginview");
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
      appBar: AppBar(title: Text("Registro"),
        centerTitle: true,
        shadowColor: Colors.green[400],
        backgroundColor: Colors.green[200],),
      body:
      Padding(padding: EdgeInsets.only(top:20),
        child:
        Column(
          children: [
            TextCustom(tecController: usernameController, icon: Icon(Icons.account_circle) , sHint: 'Escribe tu usuario', colorCaja: Colors.green[200] ?? Colors.green, colorTexto: Colors.white, colorBorde: Colors.green[400] ?? Colors.green,),
            TextCustom(tecController: passwordController, icon: Icon(Icons.lock_outline) , sHint: 'Escribe tu contraseña', colorCaja: Colors.green[200] ?? Colors.green, colorTexto: Colors.white, colorBorde: Colors.green[400] ?? Colors.green, blIsPassword: true,),
            TextCustom(tecController: passwordRepeatController, icon: Icon(Icons.lock_outline) , sHint: 'Repite tu contraseña', colorCaja: Colors.green[200] ?? Colors.green, colorTexto: Colors.white, colorBorde: Colors.green[400] ?? Colors.green, blIsPassword: true,),


            ButtonCustom(sText: "Aceptar", event: onClickAceptar, fondo: Colors.green[200] ?? Colors.green, letra: Colors.white, alto: 20, ancho: 30),
            ButtonCustom(sText: "Volver", event: onClickVolver, fondo: Colors.green[200] ?? Colors.green, letra: Colors.white, alto: 20, ancho: 30)

          ],
        )
        ,

      )
      ,
    );
  }

}