import 'package:MyMateFood/models/user.dart';
import 'package:MyMateFood/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{


  final FirebaseAuth _auth = FirebaseAuth.instance;//This allow us to use firebase authentications...
  
  //create oyr user according to firbase user...

  User _userFromFireBaseUser(FirebaseUser user){

    return user!= null ? User(uid: user.uid): null;

  }


  //method to sign in anomynously

//Since we are using doinng app with the internet we need to make async tasks

//auth change acoordingingly from firebase BE

Stream<User> get user{//This get and set evrytime the user sign in or out //

return _auth.onAuthStateChanged
.map(_userFromFireBaseUser);

}

Future signInAn() async{
 //errors can occur
 try{
   AuthResult result =  await _auth.signInAnonymously();
   //allow us to auth anonymously from the auth instance that we make earlier

   FirebaseUser user  = result.user;
   return _userFromFireBaseUser(user) ;


 }

 catch(e){
print(e.toString());
return null;

 }



}

  //sign in with email and password

 Future signInWithEmailAndPassword(String email , String password) async {

    try{

      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      return _userFromFireBaseUser(user);

      

    }catch(e){

      return null;

    }


  }

  //register with email and password

  Future registerWithEmailAndPassword(String email , String password) async {

    try{

      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;

      //create a new collection reference for this new user
      await DatabaseService(uid: user.uid).updateUserData('normal', user.email, 100);
      
      return _userFromFireBaseUser(user);

      

    }catch(e){

      return null;

    }


  }



  //sign out

  Future signOutuser() async{

    try{

     return await _auth.signOut();
    }catch(e){

      print(e.toString());
      return null;
      
      }

  }

}