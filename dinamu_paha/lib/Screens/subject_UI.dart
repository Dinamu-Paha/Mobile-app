import 'dart:convert';

import 'package:dinamu_paha/Screens/Quizzes_&_Games.dart';
import 'package:dinamu_paha/Screens/Sub_topic_UI.dart';
import 'package:dinamu_paha/Screens/studentDash.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_sinhala/flutter_sinhala.dart';

import 'Past_Papers.dart';


class Subject_UI extends StatefulWidget {
  const Subject_UI({Key? key}) : super(key: key);

  @override
  State<Subject_UI> createState() => _Subject_UIState();
}

class _Subject_UIState extends State<Subject_UI> with SingleTickerProviderStateMixin{

  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyanAccent,
    spawnOpacity: 0.2,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 20.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );

  var sub_name1 = "සිංහල";
  var sub_name2 = 'ගණිතය';
  var sub_name3 = 'ඉංග්‍රීසි';
  var sub_name4 = "පරිසරය";
  var sub_name5 = 'බුද්ධි පරීක්ෂණය';

  get password => null;

  get email => null;

  var image1 = 'assets/images/sinhala_BK.png';
  var image2 = 'assets/images/maths_BK.webp';
  var image3 = 'assets/images/english_BK.jpg';
  var image4 = 'assets/images/subtopic_parisaraya_BK.jpg';
  var image5 = 'assets/images/general_BK.webp';

  // List<dynamic> list = <dynamic>[];
  // List<String> list1 = <String>[];
  //
  // Future save(sub_id) async {
  //   final res = await http.get(
  //       Uri.parse('http://192.168.56.1:8080/subject/getsubtopic/'+sub_id.toString())
  //   );
  //
  //   List<dynamic> responsejson = json.decode(utf8.decode(res.bodyBytes));
  //   print(responsejson);
  //   list = responsejson;
  //   for(var i in list){
  //     list1.add(i['sub_topic']);
  //   }
  //   print(list1);
  // }

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: StudentDashPage(),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('දිනමු පහ - ශිෂ්‍යත්ව අත්වැල',),

        ),
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(options: particles),
          vsync: this,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Subject_UI_bk.png"),
                  fit: BoxFit.cover,
                ),
                color: Colors.lightBlue.withOpacity(0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: MediaQuery.of(context).size.width-60,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: ListView(
                      children: [
                        SizedBox(height: 40,),
                        GestureDetector(
                          onTap: (){
                            //save(36);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => SubTopic_UI(subject: sub_name1,image: image1, sub_id: 37,),
                                )
                            );
                          },
                          child: Container(
                            width: 80,
                            height: 70,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.purpleAccent.withOpacity(0.8),),
                            child: Center(child: Text('සිංහල', style: TextStyle(fontSize: 30),),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => SubTopic_UI(subject: sub_name2,image: image2, sub_id: 38,),
                                )
                            );
                          },
                          child: Container(
                            width: 80,
                            height: 70,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.greenAccent.withOpacity(0.8),),
                            child: Center(child: Text('ගණිතය', style: TextStyle(fontSize: 30),),),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => SubTopic_UI(subject: sub_name3, image: image3, sub_id: 39,),
                                )
                            );
                          },
                          child: Container(
                            width: 80,
                            height: 70,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.lightBlue.withOpacity(0.8),),
                            child: Center(child: Text('ඉංග්‍රීසි', style: TextStyle(fontSize: 30),),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => SubTopic_UI(subject:sub_name4, image: image4, sub_id: 36,),
                                ));
                          },
                          child: Container(
                            width: 80,
                            height: 70,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.lightGreenAccent.withOpacity(0.8),),
                            child: Center(child: Text('පරිසරය', style: TextStyle(fontSize: 30),),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => SubTopic_UI(subject: sub_name5, image: image5, sub_id: 40,),
                                )
                            );
                          },
                          child: Container(
                            width: 80,
                            height: 70,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.orangeAccent.withOpacity(0.8),),
                            child: Center(child: Text('බුද්ධි පරීක්ෂණය', style: TextStyle(fontSize: 30),),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Quiz_Games(),
                                ));
                          },
                          child: Container(
                            width: 100,
                            height: 70,
                            margin: EdgeInsets.fromLTRB(50, 0, 50, 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepPurple.withOpacity(1),),
                            child: Center(child: Text('Quizzes and Games', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Past_papers(),
                                ));
                          },
                          child: Container(
                            width: 100,
                            height: 70,
                            margin: EdgeInsets.fromLTRB(50, 0, 50, 30),
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
      ),
    );
  }
}

// selectimage(sub){
//   if(sub == 'සිංහල'){
//     var image = 'assets/images/sinhala_BK.png';
//     return image;
//   }
//   else if(sub == 'ගණිතය'){
//     var image = 'assets/images/maths_BK.webp';
//     return image;
//   }
//   else if(sub == 'ඉංග්‍රීසි'){
//     var image = 'assets/images/english_BK.jpg';
//     return image;
//   }
//   else if(sub == 'පරිසරය'){
//     var image = 'assets/images/subtopic_parisaraya_BK.jpg';
//     return image;
//   }
//   else
//   {
//     var image = 'assets/images/general_BK.webp';
//     return image;
//   }
// }
