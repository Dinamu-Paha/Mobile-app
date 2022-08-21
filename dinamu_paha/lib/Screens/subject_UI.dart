import 'package:flutter/material.dart';

class Subject_UI extends StatefulWidget {
  const Subject_UI({Key? key}) : super(key: key);

  @override
  State<Subject_UI> createState() => _Subject_UIState();
}

class _Subject_UIState extends State<Subject_UI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('දිනමු පහ - ශිෂ්‍යත්ව අත්වැල',),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){},
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Subject_UI_bk.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width-60,
              //padding: EdgeInsets.fromLTRB(0, 0, 0, 180),
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: ListView(
                  children: [
                    SizedBox(height: 40,),
                    GestureDetector(
                      child: Container(
                        width: 80,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(80, 0, 80, 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.purpleAccent.withOpacity(0.8),),
                        child: Center(child: Text('සිංහල', style: TextStyle(fontSize: 30),),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 80,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(80, 0, 80, 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.greenAccent.withOpacity(0.8),),
                        child: Center(child: Text('ගණිතය', style: TextStyle(fontSize: 30),),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 80,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(80, 0, 80, 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.orangeAccent.withOpacity(0.8),),
                        child: Center(child: Text('බුද්ධ ධර්මය', style: TextStyle(fontSize: 30),),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 80,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(80, 0, 80, 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.lightBlue.withOpacity(0.8),),
                        child: Center(child: Text('ඉංග්‍රීසි', style: TextStyle(fontSize: 30),),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 80,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(80, 0, 80, 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.lightGreenAccent.withOpacity(0.8),),
                        child: Center(child: Text('පරිසරය', style: TextStyle(fontSize: 30),),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 100,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepPurple.withOpacity(1),),
                        child: Center(child: Text('Quizzes and Games', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 100,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueAccent.withOpacity(1),),
                        child: Center(child: Text('Past Papers', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),),
                      ),
                    ),
                    SizedBox(height: 100,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
