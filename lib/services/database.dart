import 'package:MyMateFood/models/dish.dart';
import 'package:MyMateFood/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

//collection reference 
//the first record say lik posts in blog

 final CollectionReference dishCollection = Firestore.instance.collection('dishes');





 Future updateUserData(String dishsize , String name, int strength) async {

  return await dishCollection.document(uid).setData({

    'dishsize': dishsize,
    'name':name,
    'strength':strength,
  }) 
  ;//When user sign up then it will not update but 
  //create a new user referenced collection

 }


 //Dishlist from querysnapshop

 List<Dish> _dishListFromSnapshop( QuerySnapshot sn){

  
   return sn.documents.map((doc){

   return Dish(name: doc.data['name']?? '', strength: doc.data['strength']??0 
   ,dishsize: doc.data['dishsize']??'normal'  );

   }).toList();

 }

 //user data from snapshop

 UserData _userDataFromSnapshop( DocumentSnapshot dn){


   return UserData(uid: uid, name:dn.data['name'],
    size: dn.data['dishsize'],strength: dn.data['strength'],);

 }

 Stream<List<Dish>> get dishes {

   return dishCollection.snapshots().map(_dishListFromSnapshop);
 } 


  Stream<UserData> get userData{

    return dishCollection.document(uid).snapshots().map(_userDataFromSnapshop);
    
  }

}