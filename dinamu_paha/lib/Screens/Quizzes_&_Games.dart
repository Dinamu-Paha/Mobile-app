import 'package:dinamu_paha/Screens/subject_UI.dart';
import 'package:flutter/material.dart';

class Quiz_Games extends StatefulWidget {
  const Quiz_Games({Key? key}) : super(key: key);

  @override
  State<Quiz_Games> createState() => _Quiz_GamesState();
}

class _Quiz_GamesState extends State<Quiz_Games> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.tealAccent.withOpacity(0.3),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green, width: 3),
                                image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.done, color: Colors.green.withOpacity(0.7), size: 130,)
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 1 \n     Completed', style: TextStyle(color: Colors.green, fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 2\n           Try', style: TextStyle(color: Colors.grey, fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 3\nNot Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 4 \n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 5 \n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 6 \n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 7 \n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 8 \n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 9 \n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 10\n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 11\n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 12\n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 13 \n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 14 \n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/3)-30,
                              height: (MediaQuery.of(context).size.width/3)-30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(image: AssetImage('assets/images/img_3.png')),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text('Quiz & Games 15 \n Not Completed', style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
