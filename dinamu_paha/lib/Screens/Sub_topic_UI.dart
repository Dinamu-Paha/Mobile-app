import 'dart:convert';
import 'package:dinamu_paha/Screens/subject_UI.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'Lesson_UI.dart';

class SubTopic_UI extends StatefulWidget {
  var subject;
  var image;
  var sub_id;
  SubTopic_UI({Key? key, this.subject, this.image,  this.sub_id}) : super(key: key);

  @override
  State<SubTopic_UI> createState() => _SubTopic_UIState();
}

class _SubTopic_UIState extends State<SubTopic_UI> {
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

  // List sub_topic = [
  //   'අප අවට සත්තු',
  //   'අපේ යහපැවැත්ම',
  //   'පොලොව හා අහස',
  //   'අප හා වෙළඳ පොළ',
  //   'පැලෑටි හා ගස්වැල්',
  //   'අපි ලක් වැසියෝ',
  //   'අප පරිහරණය කරන දේ',
  //   'අපේ ආහාර',
  //   'ආරක්ෂාව හා පරිස්සම',
  // ];

  int length = 0;

  Future <List<dynamic>> getSubtopics(sub_id)async {

    print('object');
    final res = await http.get(
        Uri.parse("http://ec2-54-215-42-250.us-west-1.compute.amazonaws.com:8080/subject/getsubtopic/"+sub_id.toString())
      // headers: {'Content-Type': 'application/json'}
    );
    List<dynamic> responsejson = json.decode(utf8.decode(res.bodyBytes));
    print(responsejson);

    return responsejson;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'දිනමු පහ - ' + widget.subject,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Subject_UI(),
                  ));
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  height: MediaQuery.of(context).size.height - 300,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent.withOpacity(0.3),
                  ),
                  child: FutureBuilder<List<dynamic>>(
                    future: getSubtopics(widget.sub_id),
                    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ){
                      if(snapshot.hasData){
                        return ListView.builder(itemCount: snapshot.data?.length ,itemBuilder: (context, index){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => lesson_UI(sub_id: snapshot.data?[index]["subject_id"], sub_topic_id: snapshot.data?[index]["sub_topic_id"],),
                                    ));
                              },
                              child: Container(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width-100,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: colors[index],
                                      ),
                                      child: Text(snapshot.data?[index]["sub_topic"] ?? "",
                                        //sub_topic[index],
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                            )
                              // Text(snapshot.data?[index]["sub_topic"] ?? ""),
                            ],
                          );
                        });

                      } else return Container(
                        child: Center(
                            child: Text("Loading...")
                        ),
                      );

                    },
                  )
                  // ListView.custom(
                  //   childrenDelegate: SliverChildBuilderDelegate(
                  //     (BuildContext, index) {
                  //       return Container(
                  //         height: 50,
                  //         width: 50,
                  //         alignment: Alignment.center,
                  //         margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(25),
                  //           color: colors[index],
                  //         ),
                  //         child: Text(
                  //           sub_topic[index],
                  //           //sub_topic[index],
                  //           style: TextStyle(fontSize: 25),
                  //         ),
                  //       );
                  //     },
                  //     childCount: length,
                  //   ),
                  //   shrinkWrap: true,
                  //   padding: EdgeInsets.all(5),
                  //   scrollDirection: Axis.vertical,
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}