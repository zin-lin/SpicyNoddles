import 'package:MyMateFood/services/auth.dart';
import 'package:MyMateFood/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

//to allow access we must be in the widget not the state
final Function view;
Register({@required this.view});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


bool loading  = false;
String email;
String password ;
String error='';

final _auth = AuthService();
final _reg = GlobalKey<FormState>();
final xox = FocusNode();
  @override
  Widget build(BuildContext context) {
 return loading?Loading(): Scaffold(

      backgroundColor: Colors.blue[100],
      appBar: AppBar(actions: [
        FlatButton.icon(onPressed: (){

          widget.view();
        }, 
        
        icon: Icon(Icons.person, color: Colors.white,),
        label: Text("Sign In",
        style:TextStyle(color: Colors.white)))

      ],

      backgroundColor: Colors.blue[600],

      title: Text("Register"),
      centerTitle: true,
      
      ),

body: Container(

   
   decoration: BoxDecoration(
   /*
   image: DecorationImage(image: AssetImage("assets/bg.jpg"),
  fit: BoxFit.fill
  ),
  */
  ),
  child:   Opacity(
  opacity: 0.8,
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 50.0 , vertical: 20.0)
    ,
    child: Form(

    key: _reg,
    
    child: Column(
    
    children: <Widget>[
    
    SizedBox(height: 23.0,),
  
   Opacity(
    opacity: 0.8,
     child: TextFormField(
        
        decoration: InputDecoration(
        hintText: "Email",
        fillColor: Colors.white,
        filled: true,
  
    enabledBorder: OutlineInputBorder(
    
   
          borderRadius: BorderRadius.circular(25.0)
    ,     borderSide: BorderSide.none
        
    
        ) ,
        
        
            focusedBorder: OutlineInputBorder(
    
   
          borderRadius: BorderRadius.circular(25.0)
    ,     borderSide: BorderSide(width: 2.0, color: Colors.blue)
        
    
        ) ,
        
         ),
    
        style: TextStyle(),
        validator: (val) => val.isEmpty? "Email is required" : null,
        onChanged: (val){
   
            setState(() {
          
              email = val;
        
            });
   
        },
    
        ),
      ),
   
  
    SizedBox(height: 23.0,),
    
  
     Opacity(
        opacity: 0.8,
              child: TextFormField(
   
        decoration: InputDecoration(
         hintText: "Password",
         fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
    
   
          borderRadius: BorderRadius.circular(25.0)
    ,     borderSide: BorderSide.none
        
    
        ) ,
        
        
            focusedBorder: OutlineInputBorder(
    
   
          borderRadius: BorderRadius.circular(25.0)
    ,     borderSide: BorderSide(width: 2.0, color: Colors.blue)
        
    
        ) ,
        
        
        ),
    
        style: TextStyle(),
        validator: (val)=> val.length<6 ? 'Password too shot(at least 6 characters)': null,
        onChanged: (val){
    
        setState(() {
          password = val;
    
        });
    
        
    
        },
    
        
    
        obscureText: true,
    
        ),
      ),
    
   
    
    SizedBox(height:23.0),
   
    FlatButton(
    onPressed:()async {


      setState(() {
        loading = true;
      });
       
       if (_reg.currentState.validate()){
          dynamic res = await _auth.registerWithEmailAndPassword(email, password);
          if (res == null){

            print('error');
            setState(() {
              error ="invalid user form, please refill the form correctly";
              loading = false;
            });
          }
          



       }

    },
    
    color:Colors.blue[600],
    
    shape: RoundedRectangleBorder(
    
      borderRadius: BorderRadius.circular(16.0),
   ),
    
    padding: EdgeInsets.symmetric(horizontal:0 , vertical: 3),
    child:
    
      Text("Register",    
      style: TextStyle(
    
      color:Colors.white,
    
      ) 
      ),
    
   
    ),SizedBox(height:5)

,Text(error, style:TextStyle(color: Colors.red))

],

    
   
      ),
    
    
   
    
    
    )
    
   
    ),
  ),
),

    );
  }
}