import 'package:date_field/date_field.dart';
import 'package:dinamu_paha/Screens/studentProfile.dart';
import 'package:flutter/material.dart';

import '../Component/colors.dart';

class StudentEditProfile extends StatefulWidget {
  const StudentEditProfile({Key? key}) : super(key: key);

  @override
  State<StudentEditProfile> createState() => _StudentEditProfileState();
}

class _StudentEditProfileState extends State<StudentEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBColor,
        title: Text('Edit Profile',style: TextStyle(fontSize: 25),),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width-60,
                      child: Text('Your Details',style: TextStyle(
                          fontSize: 28,color: Colors.black, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('First name',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.person_rounded ,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('Last name',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.person_outline_outlined,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('Date of Birth',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width-60,
                      child: DateTimeFormField(

                        //dateTextStyle: (),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.calendar_month_rounded,size: 20,color: Colors.black,),
                        ),
                        // firstDate: DateTime.utc(2011),
                        // lastDate: DateTime(2013),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                        onDateSelected: (DateTime value) {
                          print(value);
                        },
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('E-mail',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.alternate_email_outlined,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('Mobile No.',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.phone,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('Home District',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.home,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('Devisional Secretary',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.home_outlined,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('Examination Year',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.home_outlined,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width-60,
                      child: Text('School Details',style: TextStyle(
                          fontSize: 28,color: Colors.black, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('School',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.school ,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('District of School',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.location_on_outlined ,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width-60,
                      child: Text('Change Password',style: TextStyle(
                          fontSize: 28,color: Colors.black, fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('If you don\'t want to change the password',style: TextStyle(color: Colors.red),),
                          Text('leave those sections blank',style: TextStyle(color: Colors.red),)
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),

                    Container(
                      child: Text('Current Password',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.lock_open,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('New Password',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.lock_person_outlined,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('Confirm New Password',style: TextStyle(fontSize: 19,color: Colors.black,),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                          ) ,
                          icon: Icon(Icons.lock_person_outlined,size: 20,color: Colors.black,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      width: MediaQuery.of(context).size.width-60,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.btnColor,
                      ),
                      child: Center(
                          child: Text('Save',style: TextStyle(fontSize: 20,color: Colors.black,),)),
                    ),
                    SizedBox(height: 20,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
