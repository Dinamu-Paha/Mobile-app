import 'package:dinamu_paha/Component/colors.dart';
import 'package:dinamu_paha/Screens/studentProfile.dart';
import 'package:dinamu_paha/Screens/subject_UI.dart';
import 'package:flutter/material.dart';

class StudentDashPage extends StatefulWidget {
  const StudentDashPage({Key? key}) : super(key: key);

  @override
  State<StudentDashPage> createState() => _StudentDashPageState();
}

class _StudentDashPageState extends State<StudentDashPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: AppColor.btnColor,
          child: ListView(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => StudentProfile(),
                            ));
                      },
                      child: Container(
                          height: 45,
                          width: 240,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.newspaper,color: Colors.white,),
                              SizedBox(width: 20,),
                              Text("Profile", style: TextStyle(
                                  fontSize: 21, color: Colors.white, fontWeight: FontWeight.w500),),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Subject_UI(),
                            ));
                      },
                      child: Container(
                          height: 45,
                          width: 240,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.newspaper,color: Colors.white,),
                              SizedBox(width: 20,),
                              Text("Home", style: TextStyle(
                                  fontSize: 21, color: Colors.white, fontWeight: FontWeight.w500),),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                          height: 45,
                          width: 240,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.newspaper,color: Colors.white,),
                              SizedBox(width: 20,),
                              Text("Do Quize", style: TextStyle(
                                  fontSize: 21, color: Colors.white, fontWeight: FontWeight.w500),),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                          height: 45,
                          width: 240,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.newspaper,color: Colors.white,),
                              SizedBox(width: 20,),
                              Text("Play Games", style: TextStyle(
                                  fontSize: 21, color: Colors.white, fontWeight: FontWeight.w500),),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                          height: 45,
                          width: 240,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.newspaper,color: Colors.white,),
                              SizedBox(width: 20,),
                              Text("Learning Materials", style: TextStyle(
                                  fontSize: 21, color: Colors.white, fontWeight: FontWeight.w500),),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),

                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                          height: 45,
                          width: 240,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.newspaper,color: Colors.white,),
                              SizedBox(width: 20,),
                              Text("Question Review", style: TextStyle(
                                  fontSize: 21, color: Colors.white, fontWeight: FontWeight.w500),),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                          height: 45,
                          width: 240,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.newspaper,color: Colors.white,),
                              SizedBox(width: 20,),
                              Text("Pastpapers", style: TextStyle(
                                  fontSize: 21, color: Colors.white, fontWeight: FontWeight.w500),),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    ],
                ),
                ],
              ),
            ],
          ),
        ),

    );
  }
}
