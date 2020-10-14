import 'package:MyMateFood/models/dish.dart';
import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {


 final Dish dish;

 FoodTile({this.dish});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : EdgeInsets.only(top: 10),
      child: Card(
          color: Color.fromARGB(200,254,254,254),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(  
             
             leading: CircleAvatar(
               
               backgroundImage: AssetImage("assets/nd.png", ),
                radius: 25.0,
                backgroundColor: Colors.red[dish.strength],
                
                

             ), 
             title: Text(dish.name),
             subtitle: Text("Take ${dish.dishsize} size"),


          )


      ),
    );
  }
}