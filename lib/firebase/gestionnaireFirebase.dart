import 'package:firebase_auth/firebase_auth.dart';

class GestionnaireFirbase{
  FirebaseAuth authInstance=FirebaseAuth.instance;
  //connexion
  Future<User>Connextion({required String email,required String mdp})async{
    User? users=(await authInstance.signInWithEmailAndPassword(email: email, password:mdp)).user;
    return users!;
  }
  //inscription
  Future<User>Enregistrer({required String email,required String mdp,required String nom,required String prenom})async{
    User?users=(await authInstance.createUserWithEmailAndPassword(email: email, password:mdp)).user;
    Map<String,dynamic>Member(){
      return{
        "uidKey":users?.uid,
        "nomKey":nom,
        "prenomKey":prenom,
        'urlimageKey':"",
        "followersKey":[users?.uid],
        "followingKey":[]
      };
    }
    return users!;
  }
}