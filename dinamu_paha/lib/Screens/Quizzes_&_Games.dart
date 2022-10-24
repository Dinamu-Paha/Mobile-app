import 'package:dinamu_paha/Screens/Game_1.dart';
import 'package:dinamu_paha/Screens/color_game.dart';
import 'package:dinamu_paha/Screens/subject_UI.dart';
import 'package:dinamu_paha/slidingGame/Board.dart';
import 'package:flutter/material.dart';
import 'package:dinamu_paha/Component/colors.dart';

class Quiz_Games extends StatefulWidget {
  const Quiz_Games({Key? key}) : super(key: key);

  @override
  State<Quiz_Games> createState() => _Quiz_GamesState();
}

class _Quiz_GamesState extends State<Quiz_Games> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('දිනමු පහ - Quizzes And Games',),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Subject_UI(),
                      ));
                },
              ),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("Quizzes", style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),)),
                  Tab(child: Text("Games", style: TextStyle(fontSize: 18,fontFamily: 'Poppins'),)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Quiz(),
                Games(),
              ],
            ),
          ),
        )
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColor.appBColor.withOpacity(0.3),
        ),
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(30, (index) => Card(
            elevation: 10,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.tealAccent.withOpacity(0.5),
            child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/img_5.png', width: 40, height: 40,),
                    Text("Qiuz And Games",style: TextStyle(),),
                    Text("$index"),
                  ],
                )
            ),
          ),
          ),
        ),
      );
  }
}

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.appBColor.withOpacity(0.3),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Game1(title: 'First Game',),
                    )
                );
              },
              child: Card(
                elevation: 20,
                shadowColor: Colors.black,
                color: Colors.lightBlueAccent.withOpacity(0.5),
                child: Container(
                  height: MediaQuery.of(context).size.height-520,
                  width: MediaQuery.of(context).size.width-100,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        height: MediaQuery.of(context).size.height-650,
                        width: MediaQuery.of(context).size.width-150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/xoxo.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        child: Text('XOXO PLAY', style: TextStyle(fontSize: 36, fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SlidingGame(),
                    )
                );
              },
              child: Card(
                elevation: 20,
                shadowColor: Colors.black,
                color: Colors.tealAccent.withOpacity(0.5),
                child: Container(
                  height: MediaQuery.of(context).size.height-520,
                  width: MediaQuery.of(context).size.width-100,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        height: MediaQuery.of(context).size.height-650,
                        width: MediaQuery.of(context).size.width-150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/sliding.webp'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        child: Text('SLIDING PUZZLE', style: TextStyle(fontSize: 36, fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ColorGame(),
                    )
                );
              },
              child: Card(
                elevation: 20,
                shadowColor: Colors.black,
                color: Colors.deepPurpleAccent.withOpacity(0.5),
                child: Container(
                  height: MediaQuery.of(context).size.height-520,
                  width: MediaQuery.of(context).size.width-100,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        height: MediaQuery.of(context).size.height-650,
                        width: MediaQuery.of(context).size.width-150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Colorgame.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        child: Text('MATCH COLOR', style: TextStyle(fontSize: 36, fontFamily: 'Poppins', fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, color: Colors.white),),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}



