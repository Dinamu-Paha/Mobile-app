import 'package:flutter/material.dart';

class SubTopic_UI extends StatefulWidget {
  const SubTopic_UI({Key? key}) : super(key: key);

  @override
  State<SubTopic_UI> createState() => _SubTopic_UIState();
}

class _SubTopic_UIState extends State<SubTopic_UI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text('දිනමු පහ - පරිසරය',),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){},
            ),
          ),
          body: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/subtopic_parisaraya_BK.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 80),
                  height: MediaQuery.of(context).size.height-256,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent.withOpacity(0.3),
                  ),
                  child: Center(
                    child: ListView(
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 80,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.cyan.withOpacity(0.8),),
                            child: Center(child: Text('අප අවට සත්තු', style: TextStyle(fontSize: 25),),),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 80,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.greenAccent.withOpacity(0.8),),
                            child: Center(child: Text('අපේ යහපැවැත්ම', style: TextStyle(fontSize: 25),),),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 80,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.blue.withOpacity(0.8),),
                            child: Center(child: Text('පොලොව හා අහස', style: TextStyle(fontSize: 25),),),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 80,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.lightGreenAccent.withOpacity(0.8),),
                            child: Center(child: Text('අප හා වෙළඳ පොළ', style: TextStyle(fontSize: 25),),),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 80,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.orange.withOpacity(0.8),),
                            child: Center(child: Text('පැලෑටි හා ගස්වැල්', style: TextStyle(fontSize: 25),),),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 80,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.pinkAccent.withOpacity(0.8),),
                            child: Center(child: Text('අපි ලක් වැසියෝ', style: TextStyle(fontSize: 25),),),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 80,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.deepOrangeAccent.withOpacity(0.8),),
                            child: Center(child: Text('අප පරිහරණය කරන දේ', style: TextStyle(fontSize: 25),),),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 80,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.green.withOpacity(0.8),),
                            child: Center(child: Text('අපේ ආහාර', style: TextStyle(fontSize: 25),),),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 80,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.yellowAccent.withOpacity(0.8),),
                            child: Center(child: Text('ආරක්ෂාව හා පරිස්සම', style: TextStyle(fontSize: 25),),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
    ),
    );
  }
}
