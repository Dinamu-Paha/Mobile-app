import 'package:dinamu_paha/Screens/Quizzes_admin.dart';
import 'package:dinamu_paha/Screens/admin_pastpapers.dart';
import 'package:dinamu_paha/Screens/signIn.dart';
import 'package:flutter/material.dart';

class admin_home extends StatefulWidget {
  const admin_home({Key? key}) : super(key: key);

  @override
  State<admin_home> createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('දිනමු පහ - Admin Home',style: TextStyle(fontFamily: 'Poppins'),),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignInPage(),
                  ));
            },
          ),
        ),
        body: Container(
          color: Colors.blue.withOpacity(0.5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => quizzes_admin(),
                      ));
                },
                child: Container(
                  height: 80,
                  width: 300,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigoAccent,
                    border: Border.all(color: Colors.white,width: 2.0)
                  ),
                  child: Center(
                      child: Text("Questions", style: TextStyle(fontFamily: 'Poppins', fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 300,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple,
                    border: Border.all(color: Colors.white,width: 2.0)
                ),
                child: Center(
                    child: Text("Lessons", style: TextStyle(fontFamily: 'Poppins', fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => AdminPastPapersPage(),
                      ));
                },
                child: Container(
                  height: 80,
                  width: 300,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlueAccent,
                      border: Border.all(color: Colors.white,width: 2.0)
                  ),
                  child: Center(
                      child: Text("Past Papers", style: TextStyle(fontFamily: 'Poppins', fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 300,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.tealAccent,
                    border: Border.all(color: Colors.white,width: 2.0)
                ),
                child: Center(
                    child: Text("Student Stats.", style: TextStyle(fontFamily: 'Poppins', fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)
                ),
              ),
            ],
          ),
        ),
    ),
    );
  }
}
