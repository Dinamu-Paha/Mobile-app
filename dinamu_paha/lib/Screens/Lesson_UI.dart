import 'package:dinamu_paha/Screens/Sub_topic_UI.dart';
import 'package:flutter/material.dart';

class lesson_UI extends StatefulWidget {
  const lesson_UI({Key? key}) : super(key: key);

  @override
  State<lesson_UI> createState() => _lesson_UIState();
}

class _lesson_UIState extends State<lesson_UI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('දිනමු පහ - අප අවට සත්තු',),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SubTopic_UI(),
                      ));
                },
              ),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("පාඩම", style: TextStyle(fontSize: 16),)),
                  Tab(child: Text("අනුමාන \n  ප්‍රශ්න", style: TextStyle(fontSize: 16),)),
                  Tab(child: Text("     පසුගිය \nවිභාග ප්‍රශ්න", style: TextStyle(fontSize: 16),)),
                ],
              ),
            ),
          ),
        )
    );
  }
}
