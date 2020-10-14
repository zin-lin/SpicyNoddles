import 'package:MyMateFood/models/user.dart';
import 'package:MyMateFood/screen/wrapper.dart';
import 'package:MyMateFood/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
          value: AuthService().user,
          child: MaterialApp(
        /*We use the wrapper here so that the we provider can listen the auth change and access
         any layer below it so we do on the top of the tree allowing us to access literally every
         sub widget tree.  */

          home:Wrapper()

      ),
    );
  }}