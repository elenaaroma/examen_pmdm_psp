import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../FirestoreObjects/FbPost.dart';
import 'FirebaseAdmin.dart';
import 'PlatformAdmin.dart';

class DataHolder{

  static final DataHolder _dataHolder = new DataHolder._internal();
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAdmin fbadmin = FirebaseAdmin();
  PlataformAdmin plAdmin = PlataformAdmin();

  String sNombre ="Post";
  late String sPostTitle;
  late FbPost selectedPost;

  DataHolder._internal(){

  }

  void initDataHolder(){

    sPostTitle = "Titulo de Post";

  }

  factory DataHolder(){
    return _dataHolder;
  }

  void insertPostEnFB(FbPost postNuevo){

    CollectionReference<FbPost> postsRef = db.collection("posts").withConverter(
        fromFirestore: FbPost.fromFirestore,
        toFirestore: (FbPost post, _) => post.toFirestore());

    postsRef.add(postNuevo);

  }

  void saveSelectedPostInCache() async{
    if(selectedPost!=null){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('fbpost_titulo', selectedPost!.titulo);
      prefs.setString('fbpost_cuerpo', selectedPost!.cuerpo);
    }

  }

  Future<FbPost> loadFbPost() async{

    if (selectedPost != null )return selectedPost;

    await Future.delayed(Duration(seconds: 10));

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? fbpost_titulo = prefs.getString('fbpost_titulo');
    fbpost_titulo ??= '';

    String? fbpost_cuerpo = prefs.getString('fbpost_cuerpo');
    fbpost_cuerpo ??= '';

    selectedPost = FbPost(titulo: fbpost_titulo , cuerpo: fbpost_cuerpo);
    return selectedPost;
  }

}