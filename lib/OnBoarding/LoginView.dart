import 'package:examen_pmdm/CustomViews/ButtonCustom.dart';
import 'package:examen_pmdm/CustomViews/TextCustom.dart';
import 'package:flutter/material.dart';


class LogingView extends StatelessWidget{

  late BuildContext _context;

  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  void OnClickAceptar() {
  Navigator.of(_context).popAndPushNamed("/homeview");
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

                ButtonCustom(sText: "Aceptar", event: OnClickAceptar, fondo: Colors.green[200] ?? Colors.green, letra: Colors.white, alto: 20, ancho: 30)
              ],
            )
          ,

        )
      ,
    );
  }

}



