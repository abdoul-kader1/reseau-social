import 'package:flutter/material.dart';
import '../Painter/mypainter.dart';
import '../custom_widget/mygradient.dart';
import '../custom_widget/mytextfield.dart';
import '../custom_widget/paddingwidth.dart';

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

  @override
  void initState() {
    _pageController =PageController();
    _nom=TextEditingController();
    _prenom=TextEditingController();
    _email=TextEditingController();
    _mdp=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    _nom.dispose();
    _prenom.dispose();
    _email.dispose();
    _mdp.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: InkWell(
          onTap:(){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: Mygradient(startcolors: Colors.white,endcolors: Colors.red),
            width: MediaQuery.of(context).size.width,
            height:(MediaQuery.of(context).size.height>700)?MediaQuery.of(context).size.height:700,
            child: SafeArea(
              child: Column(
                children: [
                  Image.asset("assets/darkBee.png",height: MediaQuery.of(context).size.height/5),
                  logOrCreatButtom(),
                  Expanded(
                      child: PageView(
                        controller: _pageController,
                        children: [
                          logCards(UserExiste:true),
                          logCards(UserExiste: false)
                        ],
                      ),
                    flex: 2,
                  )
                ],
              ),
            ),
          )
        )
      ),
    );
  }

  Widget logOrCreatButtom(){
    return Container(
      width: 300,
      height: 50,
      child: CustomPaint(
        painter:Mypainter(pageController: _pageController),
        child: Row(
          children: [
            btn(name:"Se connecter"),
            btn(name:"Créé un compte")
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

  Widget logCards({required bool UserExiste}){
    List<Widget>list=[];
    if(!UserExiste){
      list.add(Mytextfield(controller:_nom,hint: "Entrer votre nom"));
      list.add(Mytextfield(controller:_prenom,hint: "Entrer votre prenom"));
    }
    list.add(Mytextfield(controller:_email,hint: "Entrer votre email"));
    list.add(Mytextfield(controller:_mdp,obscure: true,hint: "Entrer votre mot de passe"));
    return PaddingWidth(
        child:Card(
          elevation: 7.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:list,
          ),
        ),
      bottom: 200,
    );
  }

}
