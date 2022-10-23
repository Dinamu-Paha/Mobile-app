import 'package:dinamu_paha/Component/barChartGraph.dart';
import 'package:dinamu_paha/Component/colors.dart';
import 'package:dinamu_paha/Screens/studentDash.dart';
import 'package:dinamu_paha/Screens/studentEditProfile.dart';
import 'package:dinamu_paha/Screens/studentSubjectStat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../Component/barChartModel.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {

  final List<BarChartModel> data = [
    BarChartModel(
      year: "2014",
      marks: 25,
      color: charts.ColorUtil.fromDartColor(Color(0xFF47505F)),
    ),
    BarChartModel(
      year: "2015",
      marks: 75,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      year: "2016",
      marks: 0,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      year: "2017",
      marks: 60,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModel(
      year: "2018",
      marks: 53,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      year: "2019",
      marks: 92,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      year: "2020",
      marks: 0,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: StudentDashPage(),
      appBar: AppBar(
        backgroundColor: AppColor.appBColor,
        title: Text('Profile',style: TextStyle(fontSize: 25),),
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: (){
        //
        //   },
        // ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/dpimage.png"),
                        fit: BoxFit.cover,
                      ),
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.appBColor,
                    boxShadow: [
                    BoxShadow(
                    color: Colors.black26,
                    blurRadius: 7,
                    offset: Offset(2, 4), // Shadow position
                  ),
                  ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text("Nishath Yasintha",style: TextStyle(fontSize: 25),),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text("nishathyasintha@gmail.com",style: TextStyle(fontSize: 18),),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => StudentEditProfile(),
                        ));
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: AppColor.btnColor,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(child: Text("Edit Profile")),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: MarksChart(data: data,),
                ),
            Container(
              decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black12,
                //     blurRadius: 10,
                //     offset: Offset(0.2,0.2),
                //   ),
                // ],
              ),
              height: 440,
              padding: EdgeInsets.all(10.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Progress of Subjects",style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SubjectStats(title: "සිංහල"),
                              ));
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width-60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width-60,
                        lineHeight: 50.0,
                        percent: 0.65,
                        center: Text("සිංහල", style: TextStyle(fontSize: 22),),
                        progressColor: AppColor.btnColor,
                            barRadius: const Radius.circular(30),
                      ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SubjectStats(title: "ගණිතය"),
                              ));
                        },
                        child: new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width-60,
                          lineHeight: 50.0,
                          percent: 0.5,
                          center: Text("ගණිතය", style: TextStyle(fontSize: 22),),
                          progressColor: AppColor.btnColor,
                          barRadius: const Radius.circular(30),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SubjectStats(title: "බුද්ධ ධර්මය"),
                              ));
                        },
                        child: new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width-60,
                          lineHeight: 50.0,
                          percent: 0.3,
                          center: Text("බුද්ධි පරීක්ෂණය", style: TextStyle(fontSize: 22),),
                          progressColor: AppColor.btnColor,
                          barRadius: const Radius.circular(30),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SubjectStats(title: "ඉංග්‍රීසි"),
                              ));
                        },
                        child: new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width-60,
                          lineHeight: 50.0,
                          percent: 0.8,
                          center: Text("ඉංග්‍රීසි", style: TextStyle(fontSize: 22),),
                          progressColor: AppColor.btnColor,
                          barRadius: const Radius.circular(30),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SubjectStats(title: "පරිසරය"),
                              ));
                        },
                        child: new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width-60,
                          lineHeight: 50.0,
                          percent: 1,
                          center: Text("පරිසරය", style: TextStyle(fontSize: 22),),
                          progressColor: AppColor.btnColor,
                          barRadius: const Radius.circular(30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
