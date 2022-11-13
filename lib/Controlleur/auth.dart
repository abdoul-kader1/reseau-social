import 'package:flutter/material.dart';

class Auth extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_Auth();

}

class _Auth extends State<Auth>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentification"),
      ),
    );
  }
}
