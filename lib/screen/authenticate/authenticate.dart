import 'package:MyMateFood/screen/authenticate/register.dart';
import 'package:MyMateFood/screen/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

bool showSignIn = true;



void changeView(){

  setState(() {
    showSignIn = !showSignIn;
  });
}

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return Container(

        child:SignIn(view: changeView),
        
      );
  }
  else{
    return Container(

        child:Register(view: changeView),
        
      );
  }
  
  }



}