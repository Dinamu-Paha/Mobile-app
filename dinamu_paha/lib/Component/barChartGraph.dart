import 'package:dinamu_paha/Component/colors.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'barChartModel.dart';

class MarksChart extends StatelessWidget {
final List<BarChartModel> data ;

 MarksChart({required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
          id: "Marks",
          data: data,
          domainFn: (BarChartModel series, _) => series.year,
          measureFn: (BarChartModel series, _) => series.marks,
          colorFn: (BarChartModel series, _) => series.color),
    ];
    return Container(
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 10,
        //     offset: Offset(0.2,0.2),
        //   ),
        // ],
      ),
      height: 550,
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Progress of Pastpapers",style: TextStyle(fontSize: 20),)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("07",style: TextStyle(fontSize: 50, color: AppColor.appBColor),)
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("You Have Done",style: TextStyle( color: AppColor.appBColor))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('Marks of the pastpapers'),
              Expanded(
                  child: charts.BarChart(series, animate: true,)
              )
            ],
          ),
        ),
      ),
    );
  }
}



//
//
// return _buildFinancialList(series);
//
// }
//
// Widget _buildFinancialList(series) {
//   return _barChartList != null
//       ? ListView.separated(
//     physics: NeverScrollableScrollPhysics(),
//     separatorBuilder: (context, index) => Divider(
//       color: Colors.white,
//       height: 5,
//     ),
//     scrollDirection: Axis.vertical,
//     shrinkWrap: true,
//     itemCount: _barChartList.length,
//     itemBuilder: (BuildContext context, int index) {
//       return Container(
//         height: MediaQuery.of(context).size.height/ 2.3,
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(_barChartList[index].month,
//                     style: TextStyle(
//                         color: Colors.black, fontSize: 22,
//                         fontWeight: FontWeight.bold)
//                 ),
//               ],
//             ),
//             Expanded( child: charts.BarChart(series,
//                 animate: true)
//             ),
//           ],
//         ),
//       );
//     },
//   )
//       : SizedBox();
// }