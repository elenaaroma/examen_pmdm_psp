import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../FirestoreObjects/FbPost.dart';
import '../Singletone/DataHolder.dart';

class PostView extends StatefulWidget {
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  FbPost _datosPost = FbPost(cuerpo: "NAN",titulo: "NAN");
  bool blPostLoaded = false;


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    cargarPostGuardadoEnCache();

  }

  void cargarPostGuardadoEnCache() async {
    var temp1 = await DataHolder().loadFbPost();
    setState(() {
      _datosPost = temp1!;
      blPostLoaded= true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar( title: Text(DataHolder().sNombre),
        centerTitle: true,
        shadowColor: Colors.green[400],
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
          Text(_datosPost.titulo),
          Text(_datosPost.cuerpo),

        ],
      ),
    );

  }
}

