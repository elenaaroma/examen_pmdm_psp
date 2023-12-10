import 'package:examen_pmdm/Main/HomeView.dart';
import 'package:examen_pmdm/OnBoarding/LoginView.dart';
import 'package:examen_pmdm/OnBoarding/RegistroView.dart';
import 'package:examen_pmdm/OnBoarding/SplashView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Main/PostView.dart';
import 'OnBoarding/AjustesView.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp;

    materialApp = MaterialApp(
          title:"Examen PMDM_PSP",
    routes: {
      '/loginview': (context)=> LoginView(),
      '/registergview': (context)=> RegistroView(),
      '/splashview' : (context) => SplashView(),
      '/homeview' : (context) => HomeView(),
      '/ajustesview' : (context) => AjustesView(),
      '/postview' : (context) => PostView(),
    },
    initialRoute: '/splashview',
    debugShowCheckedModeBanner: false,
    );

    return materialApp;
  }
  
}