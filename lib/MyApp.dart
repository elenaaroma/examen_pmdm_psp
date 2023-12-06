import 'package:examen_pmdm/OnBoarding/LoginView.dart';
import 'package:examen_pmdm/OnBoarding/RegistroView.dart';
import 'package:examen_pmdm/OnBoarding/SplashView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp;

    materialApp = MaterialApp(
          title:"Examen PMDM_PSP",
    routes: {
      '/loginview': (context)=> LogingView(),
      '/registergview': (context)=> RegistroView(),
      '/splashview' : (context) => SplashView(),
    },
    initialRoute: '/splashview',
    debugShowCheckedModeBanner: false,
    );

    return materialApp;
  }
  
}