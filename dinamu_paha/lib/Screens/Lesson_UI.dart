import 'package:dinamu_paha/Screens/Sub_topic_UI.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

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
            body: TabBarView(
              children: [
                FirstScreen(),
                Icon(Icons.train),
                Icon(Icons.car_crash),
              ],
            ),
          ),
        )
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _isLoading = true;
  late PDFDocument document;

  @override

  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/Pdf/5  ශ්_රේණිය - පරිසරය - අප අවට සතුන් (අංග සම්පූර්ණ සිද්ධාන්ත නිබන්ධනය).pdf');

    setState(() => _isLoading = false);
  }

  Widget build(BuildContext context) {
    return Container();
  }
}

