import 'package:flutter/material.dart';

class Subject_UI extends StatefulWidget {
  const Subject_UI({Key? key}) : super(key: key);

  @override
  State<Subject_UI> createState() => _Subject_UIState();
}

class _Subject_UIState extends State<Subject_UI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Dinamu paha - Sinhala',),
            leading: IconButton(
              icon: Icon(Icons.arrow_back,),
              onPressed: (){},
            ),
            flexibleSpace: Image.asset('assets/images/img_5.webp',fit: BoxFit.cover,),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(child: Text('Questions',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 16,),)),
                Tab(child: Text('Materials',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 16),)),
                Tab(child: Text('Past Papers',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 16),)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
