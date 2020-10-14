import 'package:MyMateFood/models/user.dart';
import 'package:MyMateFood/services/database.dart';
import 'package:MyMateFood/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:MyMateFood/shared/constants.dart';
import 'package:provider/provider.dart';


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {


 final _formKey = GlobalKey<FormState>();
 final List<String> size = ['small', 'normal', 'medium asset', 'big', 'exclusive'];

 String _currentName;
 String _currentSize;
 int _currentStrength;

  @override
  Widget build(BuildContext context) {


    final user  = Provider.of<User>(context);

    return StreamBuilder<UserData>(
       stream: DatabaseService(uid:user.uid).userData,
       builder:(context , snapshop){ 
         if (snapshop.hasData){
    
        UserData userData = snapshop.data;
          print( userData.size);
        return Form(
        key: _formKey,
        child: Column(children:<Widget> [


            Text("Update your dish settings",
            style: TextStyle(fontSize: 18),),

            SizedBox(height:20.0),

            TextFormField(
               
               decoration: Textinputde.copyWith(hintText : "name"),
               validator: (val)=> val.isEmpty?'Enter a Name':null,
               onChanged: (val)=> setState(()=> _currentName = val),
               initialValue:userData.name


            ),
            SizedBox(  height: 20.0, ),

            //Combobox
            DropdownButtonFormField(
              

              value: _currentSize ?? userData.size,        
              
              decoration: Textinputde,
              items: size.map((size){

                   return DropdownMenuItem(

                     value: size,
                     child: Text("$size size"),
                     );}
              ).toList(),
               onChanged: (val)=> setState(()=> _currentSize = val),
               //value: _currentSize?? userData.size,
               ),

               

            //slider

            Slider(
              activeColor: Colors.red[_currentStrength?? userData.strength],
              inactiveColor: Colors.red[100],
              min: 100,
              max: 900,
              divisions: 8,
              onChanged: (val)=> setState(()=> _currentStrength = val.round()),
              value: (_currentStrength?? userData.strength).toDouble(),

            ),

            FlatButton(
              
              color: Colors.red[_currentStrength?? userData.strength],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              child: Text(

              "Update",
              style:TextStyle(color: Colors.white)
              
              ),

              onPressed: () async {
                
               if (_formKey.currentState.validate()){

                 await DatabaseService(uid: user.uid).updateUserData(
                   _currentSize?? userData.size, 
                   _currentName?? userData.name,
                    _currentStrength?? userData.strength);

                    print(_currentSize);

                    Navigator.pop(context);
               }
                


              },
              


            ),

        ],)
        
      );

         }
         else{
          return Loading();

         }
        }
    );
  }
}