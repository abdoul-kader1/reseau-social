import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_Acceuil();

}

class _Acceuil extends State<Acceuil>{
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(
     title: Text("Acceuil"),
   ),
 );
}
}
