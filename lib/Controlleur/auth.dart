import 'package:flutter/material.dart';
import '../Painter/mypainter.dart';

class Auth extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_Auth();

}

class _Auth extends State<Auth>{
  late PageController _pageController;
  late TextEditingController _nom;
  late TextEditingController _prenom;
  late TextEditingController _email;
  late TextEditingController _mdp;
  late TextEditingController _surnom;

  @override
  void initState() {
    _pageController =PageController();
    _nom=TextEditingController();
    _prenom=TextEditingController();
    _email=TextEditingController();
    _mdp=TextEditingController();
    _surnom=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    _nom.dispose();
    _prenom.dispose();
    _email.dispose();
    _mdp.dispose();
    _surnom.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: InkWell(
          onTap:null,
          child: SafeArea(
            child: Column(
              children: [
                Image.asset("assets/darkBee.png",height: MediaQuery.of(context).size.height/5,),
                logOrCreatButtom()
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget logOrCreatButtom(){
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter:Mypainter(pageController: _pageController),
        child: Row(
          children: [
            btn(name: "Se connecter"),
            btn(name: "S'authentifier")
          ],
        ),
      ),
    );
  }

  Expanded btn({required String name}){
    return Expanded(
        child: TextButton(
          child: Text(name),
          onPressed: (){
            int page =(_pageController.page==0.0)?1:0;
            _pageController.animateToPage(
                page,
                duration:Duration(microseconds: 500),
                curve:Curves.bounceOut
            );
          },
        )
    );
  }

}
