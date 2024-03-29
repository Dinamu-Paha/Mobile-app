import 'package:dinamu_paha/Screens/Quizzes_&_Games.dart';
import 'package:dinamu_paha/Screens/Sub_topic_UI.dart';
import 'package:dinamu_paha/Screens/studentDash.dart';
import 'package:flutter/material.dart';

class Main_Subject extends StatefulWidget {
  const Main_Subject({Key? key}) : super(key: key);

  @override
  State<Main_Subject> createState() => _Main_SubjectState();
}

class _Main_SubjectState extends State<Main_Subject> with SingleTickerProviderStateMixin{

  List<Color> colors = [
    Colors.purpleAccent.withOpacity(0.8),
    Colors.greenAccent.withOpacity(0.8),
    Colors.orangeAccent.withOpacity(0.8),
    Colors.lightBlue.withOpacity(0.8),
    Colors.lightGreenAccent.withOpacity(0.8)
  ];

  List subject = [
    'සිංහල',
    'ගණිතය',
    'බුද්ධ ධර්මය',
    'ඉංග්‍රීසි',
    'පරිසරය',
  ];

  // ParticleOptions particles = const ParticleOptions(
  //   baseColor: Colors.cyanAccent,
  //   spawnOpacity: 0.0,
  //   opacityChangeRate: 0.25,
  //   minOpacity: 0.1,
  //   maxOpacity: 0.4,
  //   particleCount: 70,
  //   spawnMaxRadius: 15.0,
  //   spawnMaxSpeed: 100.0,
  //   spawnMinSpeed: 30,
  //   spawnMinRadius: 7.0,
  // );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: StudentDashPage(),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('දිනමු පහ - ශිෂ්‍යත්ව අත්වැල'),

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
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    //SizedBox(height: 30,),
                    ListView.custom(
                      childrenDelegate: SliverChildBuilderDelegate((BuildContext, index) {
                        return Container(
                          height: 70,
                          width: 50,
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: colors[index],),
                          child: Text(subject[index],style: TextStyle(fontSize: 30),),
                        );
                      },
                        childCount: 5,
                      ),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(5),
                      scrollDirection: Axis.vertical,
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
                        width: 300,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepPurple.withOpacity(1),),
                        child: Center(child: Text('Quizzes and Games', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 300,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueAccent.withOpacity(1),),
                        child: Center(child: Text('Past Papers', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                  ),
              ),
              ),
            ),
        ),
      );
  }
}
