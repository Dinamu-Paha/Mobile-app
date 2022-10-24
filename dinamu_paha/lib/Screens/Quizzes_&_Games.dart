import 'package:dinamu_paha/Screens/subject_UI.dart';
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
    return Container();
  }
}



