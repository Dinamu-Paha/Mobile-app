import 'dart:async';

import 'package:dinamu_paha/Component/colors.dart';
import 'package:dinamu_paha/Screens/studentProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SubjectStats extends StatefulWidget {
  var title;
   SubjectStats({Key? key, this.title }) : super(key: key);

  @override
  State<SubjectStats> createState() => _SubjectStatsState();
}

class _SubjectStatsState extends State<SubjectStats> {
  double progressValue = 0;
  late Timer _timer;

  @override
  // void initState() {
  //   super.initState();
  //   if (mounted) {
  //     _timer = Timer.periodic(const Duration(milliseconds: 1000), (Timer _timer) {
  //       setState(() {
  //         if (progressValue == 100) {
  //           progressValue = 0;
  //         } else {
  //           progressValue++;
  //         }
  //       });
  //     });
  //   }
  // }
  double _icounter = 70; // to load progress bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBColor,
        title: Text("${widget.title} Statics"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => StudentProfile(),
                ));
          },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width,

              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width-50,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: SfRadialGauge(
                                enableLoadingAnimation: true,
                                  animationDuration: 3000,
                                  axes: [
                                    RadialAxis(
                                        minimum: 0,
                                        maximum: 100,
                                        showLabels: false,
                                        showTicks: false,
                                        startAngle: 120,
                                        endAngle: 60,
                                        radiusFactor: 0.8,
                                        axisLineStyle: AxisLineStyle(
                                          thickness: 0.2,
                                          cornerStyle: CornerStyle.bothCurve,
                                          color: Color.fromARGB(30, 0, 169, 181),
                                          thicknessUnit: GaugeSizeUnit.factor,
                                        ),
                                        pointers: [
                                          RangePointer(
                                            color: AppColor.appBColor,
                                            value: _icounter,
                                            cornerStyle: CornerStyle.bothCurve,
                                            width: 0.2,
                                            sizeUnit: GaugeSizeUnit.factor,
                                          ),

                                        ],
                                        annotations: [
                                          GaugeAnnotation(
                                              positionFactor: 0.1,
                                              angle: 90,
                                              widget: Text(_icounter.toStringAsFixed(0) + ' / 100', style: TextStyle(fontSize: 11),))
                                        ]
                                    )
                                  ]
                              ),
                            ),
                            Row(
                              children: [
                                Text("Progress of ${widget.title}",style: TextStyle(fontSize: 24),)
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text("5/12",style: TextStyle(fontSize: 60, color: AppColor.appBColor),)
                              ],
                            ),
                            Row(
                              children: [
                                Text("SubTopics you have finished",style: TextStyle(fontSize: 20, color: AppColor.appBColor),)
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
