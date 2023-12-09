import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CustomViews/BottomMenu.dart';
import '../CustomViews/PostCellView.dart';
import '../CustomViews/PostGridCellView.dart';
import '../FirestoreObjects/FbPost.dart';
import '../Singletone/DataHolder.dart';

class HomeView extends StatefulWidget{

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FbPost> posts = [];
  bool bIsList = false;

  void onBottomMenuPressed(int indice) {
    // TODO: implement onBottomMenuPressed

    setState(() {
      if (indice == 1){
        bIsList = false;
      }else if(indice == 0){
        bIsList = true;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descargarPosts();
  }

  void descargarPosts() async{

    CollectionReference<FbPost> reference = DataHolder().db.collection("posts").withConverter(
        fromFirestore: FbPost.fromFirestore,
        toFirestore: (FbPost post,_) => post.toFirestore());

   QuerySnapshot<FbPost> querySnapshot = await reference.get();

    for(int i = 0 ; i < querySnapshot.docs.length; i++){
      setState(() {
        posts.add(querySnapshot.docs[i].data());
      });
    }

  }

  Widget? creadorDeItemLista (BuildContext context , int index){
    return PostCellView(sText: posts[index].titulo,
        dFontSize: 20,
        iColorCode: 0,
        iPosicion: index,
        onItemListClickedFun: onItemListClicked
    );
  }

  Widget? creadorDeItemMatriz (BuildContext context , int index){
    return PostGridCellView(sText: posts[index].titulo,
        dFontSize: 20,
        iColorCode: 0,
        dHeigth : 200,
        iPosicion: index,
        onItemListClickedFun: onItemListClicked
    );
  }

  Widget creadorDeSeparadorLista (BuildContext context , int index){
    return Column(
      children: [
        Divider(),
      ],
    );
  }

  void onItemListClicked(int index){

    DataHolder().selectedPost = posts[index];

    DataHolder().saveSelectedPostInCache();

    Navigator.of(context).pushNamed("/postview");

  }

  Widget? celdasOLista (bool isList){

    if(bIsList){
      return ListView.separated(
        padding: EdgeInsets.all(50),
        itemCount: posts.length,
        itemBuilder: creadorDeItemLista,
        separatorBuilder: creadorDeSeparadorLista,
      );
    }else{
      return  GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemCount: posts.length,
          itemBuilder: creadorDeItemMatriz
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
        centerTitle: true,
        shadowColor: Colors.green[400],
        backgroundColor: Colors.green[200],),
      body: Center(
          child: celdasOLista(bIsList)
      ) ,
      bottomNavigationBar: BottomMenu(onBotonesClicked: onBottomMenuPressed),
    );
  }
}