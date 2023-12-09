import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CustomViews/PostCellView.dart';
import '../FirestoreObjects/FbPost.dart';
import '../Singletone/DataHolder.dart';

class HomeView extends StatefulWidget{

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FbPost> posts = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
        centerTitle: true,
        shadowColor: Colors.green[400],
        backgroundColor: Colors.green[200],),
      body: Center(
          child: ListView.separated(
            padding: EdgeInsets.all(50),
            itemCount: posts.length,
            itemBuilder: creadorDeItemLista,
            separatorBuilder: creadorDeSeparadorLista,
          )
      ) ,
    );
  }
}