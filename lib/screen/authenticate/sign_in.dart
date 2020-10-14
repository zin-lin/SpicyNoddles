import 'package:MyMateFood/services/auth.dart';
import 'package:MyMateFood/shared/constants.dart';
import 'package:MyMateFood/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignIn extends StatefulWidget {

final Function view;

SignIn({@required this.view});


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final _auth = AuthService();
final _keyer = GlobalKey<FormState>();
bool loading = false;


String error = "";

String email;
String password;

  @override
  Widget build(BuildContext context) {
    return loading?Loading(): Scaffold(

      backgroundColor: Colors.blue[100],

      appBar: AppBar(actions: [
        FlatButton.icon(onPressed: (){
           widget.view();
        }, 
        
        icon: Icon(Icons.person, color: Colors.white,),
        label: Text("Register",
        style:TextStyle(color: Colors.white)))

      ],
      backgroundColor: Colors.blue[600],

      title: Text("Sign In"),

      centerTitle: true,
      
      ),

body: Opacity(
  opacity: 0.8,
  child:   Container(
  
  padding: EdgeInsets.symmetric(horizontal: 50.0 , vertical: 20.0)
  
  ,
  
  child: Form(
  
  key: _keyer,
  
  child: Column(
  
  
  
  children: <Widget>[
  
  
  
  SizedBox(height: 23.0,),
  
  TextFormField(
  
  decoration: Textinputde.copyWith(hintText: "Email"),
  
  validator: (val)=> val.isEmpty ? 'Enter an email': null,
  
  style: TextStyle(),
  
  onChanged: (val){
  
  
  
  setState(() {
  
    email = val;
  
  });
  
  },
  
  
  
  ),
  
  
  
  SizedBox(height: 23.0,),
  
  
  
  TextFormField(
  
  decoration: Textinputde,
  
  style: TextStyle(
  
  
  
  ),
  
  validator: (val)=> val.length<6 ? 'Password too shot(at least 6 characters)': null,
  
  onChanged: (val){
  
  setState(() {
  
    password = val;
  
  });
  
  
  
  },
  
  obscureText: true,
  
  
  
  ),
  
  
  
  SizedBox(height:23.0),
  
  
  
  
  
  FlatButton(
  
    
  
  onPressed:()async {
  
  
  
  if (_keyer.currentState.validate()){
  
   setState(() {
     loading = true;
   });
  
  
    dynamic res = await _auth.signInWithEmailAndPassword(email, password);
  
  
  
    if (res == null){
  
         
  
      setState(() {
  
        
  
        error = "invalid user";
        loading =false;
  
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
  
    Text("Sign in", 
  
    
  
    
  
    style: TextStyle(
  
    color:Colors.white,
  
    )
  
    
  
    ),
  
  
  
  
  
  )
  
  
  
  ,SizedBox(height: 5)
  
  
  
  ,Text(error, style:TextStyle(color: Colors.red))
  
  
  
  ],
  
  
  
  
  
  
  
    ),
  
  
  
  
  
  
  
  
  
  
  
  
  
  )
  
  
  
  
  
  ),
),

    );
  }
}