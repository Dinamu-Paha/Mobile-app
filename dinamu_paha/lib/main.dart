import 'package:dinamu_paha/Screens/signIn.dart';
import 'package:flutter/material.dart';
import 'Screens/singUp.dart';
import 'Screens/subject_UI.dart';

import 'Screens/home.dart';
import 'Screens/studentDash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamu paha',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}
