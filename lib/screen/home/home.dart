import 'package:MyMateFood/models/dish.dart';
import 'package:MyMateFood/screen/home/dish_list.dart';
import 'package:MyMateFood/screen/home/settings_form.dart';
import 'package:MyMateFood/services/auth.dart';
import 'package:MyMateFood/services/database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {



final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {


   void _showSettings(){

     showModalBottomSheet(context: context,
     
     
      builder: (context){

        return Container(
         
           padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 60.0),
           child: SettingsForm(),
           color: Colors.grey[200],

        );
      }
      
      );

   }


    return  StreamProvider <List<Dish>>.value(
      value: DatabaseService().dishes,
          child: Scaffold(
          backgroundColor:  Color.fromARGB(255,234,234,234),
          appBar: AppBar(actions: [

            FlatButton.icon(onPressed: () async {
                await _auth.signOutuser();
             
            },
            
            icon:Icon(Icons.logout,color: Colors.white, ),
            label:Text("Log out",
            
            style: TextStyle(color: Colors.white,),),
        
            ),
           FlatButton.icon(
              icon: Icon(Icons.settings, color: Colors.white,),
              label: Text('settings', style: TextStyle(color: Colors.white),),
              onPressed:() => _showSettings(),
              
              )

               


          ],
          title: Text("MyFood"),
          backgroundColor: Colors.blue[400],
          elevation:0.8,


          
          ) ,
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(image: 
          AssetImage("assets/exp.jpg"),
          fit: BoxFit.cover
          
          )
          
          ),
          
          child: DishList())
        ,),
      );
    
  }
}