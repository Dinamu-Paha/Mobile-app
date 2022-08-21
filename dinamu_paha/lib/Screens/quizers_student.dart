import 'package:flutter/material.dart';

import '../Component/colors.dart';

class QuizersStudentPage extends StatefulWidget {
  const QuizersStudentPage({Key? key}) : super(key: key);

  @override
  State<QuizersStudentPage> createState() => _QuizersStudentPageState();
}

class _QuizersStudentPageState extends State<QuizersStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColor.appBColor,
        title: Text('Quize',style: TextStyle(fontSize: 25),),
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: (){
        //
        //   },
        // ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img_10.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
