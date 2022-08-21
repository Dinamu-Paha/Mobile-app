<<<<<<< HEAD
import 'package:dinamu_paha/Screens/Add_question.dart';
import 'package:dinamu_paha/Screens/signIn.dart';
import 'package:flutter/material.dart';
import 'Screens/singUp.dart';
import 'Screens/subject_UI.dart';
import 'Screens/Sub_topic_UI.dart';
import 'Screens/Quizzes_admin.dart';
=======
import 'package:flutter/material.dart';
>>>>>>> af2b2febadee73157536358e5a894bd928136ae3
import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Dinamu paha',
      theme: ThemeData(
        fontFamily: "KidZone",
        primarySwatch: Colors.blue,
      ),

<<<<<<< HEAD
      home: Add_Question(),
=======
      home: HomePage(),
>>>>>>> af2b2febadee73157536358e5a894bd928136ae3
    );
  }
}
