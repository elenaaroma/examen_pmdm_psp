import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_pmdm/CustomViews/TextCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../FirestoreObjects/FbPost.dart';
import '../Singletone/DataHolder.dart';

class PostCreateView extends StatelessWidget {

  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController tecTitulo=TextEditingController();
  TextEditingController tecCuerpo=TextEditingController();

  late BuildContext _context ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _context = context;

    return Scaffold(
      appBar: AppBar( title: Text(DataHolder().sNombre),
        centerTitle: true,
        shadowColor: Colors.green[400],
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
          
          Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                child: TextCustom(tecController: tecTitulo,
                sHint: 'Escribe un titulo',
                  icon: Icon(Icons.text_fields),
                  colorCaja: Colors.green[200] ?? Colors.green,
                  colorTexto: Colors.white,
                  colorBorde: Colors.green[400] ?? Colors.green),
          ),

          Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                child: TextCustom(tecController: tecCuerpo,
                  sHint: 'Escribe un titulo',
                  icon: Icon(Icons.text_fields),
                  colorCaja: Colors.green[200] ?? Colors.green,
                  colorTexto: Colors.white,
                  colorBorde: Colors.green[400] ?? Colors.green),
          ),
          TextButton(onPressed: (){

            FbPost postNuevo = new FbPost(titulo: tecTitulo.text,
                cuerpo: tecCuerpo.text);

              DataHolder().insertPostEnFB(postNuevo);

              Navigator.of(_context).popAndPushNamed("/homeview");

           }, child: Text("Postear"))

        ],
      ),
    );

  }

}

