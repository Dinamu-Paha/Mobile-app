import 'dart:convert';

import 'package:dinamu_paha/Screens/Game_1.dart';
import 'package:dinamu_paha/Screens/color_game.dart';
import 'package:dinamu_paha/Screens/quizeInside.dart';
import 'package:dinamu_paha/Screens/subject_UI.dart';
import 'package:dinamu_paha/slidingGame/Board.dart';
import 'package:flutter/material.dart';
import 'package:dinamu_paha/Component/colors.dart';
import 'package:http/http.dart' as http;
import 'package:animated_text_kit/animated_text_kit.dart';

class Quiz_Games extends StatefulWidget {
  var quizName;
   Quiz_Games({Key? key, this.quizName}) : super(key: key);

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
                Quiz(quizName: widget.quizName),
                Games(),
              ],
            ),
          ),
        )
    );
  }
}

class Quiz extends StatefulWidget {
  var quizName;
   Quiz({Key? key, this.quizName}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  //getQuizeNames
  Future <List<dynamic>> getQuizzers()async {
    final res = await http.get(Uri.parse('http://192.168.1.102:8080/question/getquizzes')
    );
    List<dynamic> responsejson = json.decode(utf8.decode(res.bodyBytes));
    return responsejson;
  }
  //Load a Quiz


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
        decoration: BoxDecoration(
          color: AppColor.appBColor.withOpacity(0.3),
        ),
        child: FutureBuilder<List<dynamic>>(
          future: getQuizzers(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ){
            if(snapshot.hasData){
              return Row(
                children: [
                  SizedBox(width: 30,),
                  Expanded(
                    child: ListView.builder(itemCount: snapshot.data?.length ,itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => QuizeInside(quizName: snapshot.data?[index],),
                                    )
                                );
                              },
                              child: Container(
                                height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    elevation: 30,
                                      //child: Center(child: Text(snapshot.data?[index] ?? "", style: TextStyle(fontSize: 40, fontFamily: 'poppins', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),)),
                                    child: Center(
                                      child: DefaultTextStyle(
                                        style: const TextStyle(
                                            fontSize: 40,
                                            fontFamily: 'poppins',
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                        ),
                                        child: AnimatedTextKit(
                                            isRepeatingAnimation: false,
                                            animatedTexts: [
                                              TyperAnimatedText(snapshot.data?[index] ?? ""
                                                  ,speed: Duration(milliseconds: 100)),
                                            ]
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: 30,),
                ],
              );
            } else return Container(
              child: Center(
                  child: Text("Loading...")
              ),
            );

          },
        ),
        // GridView.count(
        //   crossAxisCount: 3,
        //   children: List.generate(30, (index) => Card(
        //     elevation: 10,
        //     margin: EdgeInsets.all(10),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     color: Colors.tealAccent.withOpacity(0.5),
        //     child: Container(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Image.asset('assets/images/img_5.png', width: 40, height: 40,),
        //             Text("Qiuz And Games",style: TextStyle(),),
        //             Text("$index"),
        //           ],
        //         )
        //     ),
        //   ),
        //   ),
        // ),
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



