
import 'package:flutter/material.dart';

const Textinputde =InputDecoration(
    
        hintText: "Password",
        fillColor: Colors.white,
        filled: true,
        enabledBorder:OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide.none
          
        
    
        ) ,
        
        
            focusedBorder: OutlineInputBorder(
    
   
          borderRadius: BorderRadius.all(Radius.circular(25))
    ,     borderSide: BorderSide(width: 2.0, color: Colors.blue)
        
    
        )
    
);