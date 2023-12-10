
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Singletone/DataHolder.dart';

class DrawerClass extends StatelessWidget{

  Function(int indice)? onItemTap;

  DrawerClass({Key? key,required this.onItemTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(

              color: Colors.green,
            ),
            child: Text(
                style: TextStyle(color: Colors.white),
                'Header'
            ),
          ),
          ListTile(
            selectedColor: Colors.green,
            selected: true,
            leading: Icon(Icons.exit_to_app, color: Colors.green),
            title: const Text('Salir'),
            onTap: () {
              onItemTap!(0);

            },
          ),
          ListTile(
            selectedColor: Colors.green,
            selected: true,
            leading: Icon(Icons.settings, color: Colors.green),
            title: const Text('Ajustes'),
            onTap: () {
              onItemTap!(1);
            },
          ),
        ],
      ),
    );
  }

}