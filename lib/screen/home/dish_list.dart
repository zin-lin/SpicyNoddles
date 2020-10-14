import 'package:MyMateFood/models/dish.dart';
import 'package:MyMateFood/screen/home/food_tile.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';//Not Needed
import 'package:provider/provider.dart';

class DishList extends StatefulWidget {
  @override
  _DishListState createState() => _DishListState();
}

class _DishListState extends State<DishList> {
  @override
  Widget build(BuildContext context) {

   final dishes = Provider.of<List<Dish>>(context) ?? [];
   //print(dishes.documents);

   dishes.forEach((d) {
     print('${d.name}||${d.dishsize}||${d.strength}');
   });

    return ListView.builder(

      itemCount: dishes.length,
      itemBuilder: (context , index){

        return FoodTile(dish: dishes[index]);


      },
      
    );
  }
}
