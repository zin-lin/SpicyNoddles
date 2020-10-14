import 'package:MyMateFood/models/user.dart';
import 'package:MyMateFood/screen/authenticate/authenticate.dart';
import 'package:MyMateFood/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final User user = Provider.of<User>(context);
    //We when use provider dun need a stateful object because if we pass in build context(since stateless 
    //widgets are not rebuildable provider changes information, to allow all infinite access
    //we wrap with it in the main file- "main.dart")

    print(user);

    //return either home or authenticate widget page

    if (user == null){

      return Authenticate();
    }

    else{

      return Home();
    }
    

  }
}