import 'package:dinamu_paha/Screens/Sub_topic_UI.dart';
import 'package:dinamu_paha/Screens/subject_UI.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/services.dart';

import 'Lesson_UI.dart';

class Sub_Subtopic_UI extends StatefulWidget {
  var subject;
  Sub_Subtopic_UI({Key? key, this.subject}) : super(key: key);

  @override
  State<Sub_Subtopic_UI> createState() => _Sub_Subtopic_UIState();
}

class _Sub_Subtopic_UIState extends State<Sub_Subtopic_UI> with SingleTickerProviderStateMixin{

  List<Color> colors = [
    Colors.deepPurpleAccent.withOpacity(0.8),
    Colors.lightGreenAccent.withOpacity(0.8),
    Colors.cyanAccent.withOpacity(0.8),
    Colors.orangeAccent.withOpacity(0.8),
    Colors.tealAccent.withOpacity(0.8),
    Colors.lightBlueAccent.withOpacity(0.8),
    Colors.purpleAccent.withOpacity(0.8),
    Colors.yellow.withOpacity(0.8),
    Colors.cyan.withOpacity(0.8),
    Colors.deepPurpleAccent.withOpacity(0.8),
    Colors.lightGreenAccent.withOpacity(0.8),
    Colors.cyanAccent.withOpacity(0.8),
    Colors.orangeAccent.withOpacity(0.8),
    Colors.tealAccent.withOpacity(0.8),
    Colors.lightBlueAccent.withOpacity(0.8),
    Colors.purpleAccent.withOpacity(0.8),
    Colors.yellow.withOpacity(0.8),
    Colors.cyan.withOpacity(0.8),
  ];

  List sub_topic = [
    'අප අවට සත්තු',
    'අපේ යහපැවැත්ම',
    'පොලොව හා අහස',
    'අප හා වෙළඳ පොළ',
    'පැලෑටි හා ගස්වැල්',
    'අපි ලක් වැසියෝ',
    'අප පරිහරණය කරන දේ',
    'අපේ ආහාර',
    'ආරක්ෂාව හා පරිස්සම',
  ];

  ParticleOptions particles = const ParticleOptions(
    //image: Image(image: AssetImage('assets/images/star_stroke.png')),
    baseColor: Colors.lightBlueAccent,
    spawnOpacity: 0.8,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 20.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('දිනමු පහ - '),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SubTopic_UI(subject: "පරිසරය", sub_id: 30,),
                  ));
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                height: MediaQuery.of(context).size.height-90,
                decoration: BoxDecoration(
                  //color: Colors.lightBlueAccent.withOpacity(0.5),
                  image: DecorationImage(
                      image: AssetImage('assets/images/Morning_BK.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView.custom(
                  childrenDelegate: SliverChildBuilderDelegate((BuildContext, index) {
                    return Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: colors[index],),
                      child: Text(sub_topic[index],style: TextStyle(fontSize: 25),),
                    );
                  },
                    childCount: 4,
                  ),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
