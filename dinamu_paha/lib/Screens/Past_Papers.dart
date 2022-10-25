import 'package:dinamu_paha/Screens/pastpaperyear.dart';
import 'package:flutter/material.dart';
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


class Past_papers extends StatefulWidget {
  const Past_papers({Key? key}) : super(key: key);

  @override
  State<Past_papers> createState() => _Past_papersState();
}

class _Past_papersState extends State<Past_papers> {

  Future <List<dynamic>> getQuizzers()async {
    final res = await http.get(Uri.parse('http://ec2-54-215-42-250.us-west-1.compute.amazonaws.com:8080/question/getpastpaper')
    );
    List<dynamic> responsejson = json.decode(utf8.decode(res.bodyBytes));
    return responsejson;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('දිනමු පහ - Past Papers',),
        ),
        body: Container(
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
          builder: (BuildContext context) => PPyear(year: snapshot.data?[index].toString() ?? "",),
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
        TyperAnimatedText(snapshot.data?[index].toString() ?? ""
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
        ),
      ),
    );
  }
}
