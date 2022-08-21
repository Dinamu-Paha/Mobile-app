import 'dart:convert';
import 'dart:core';
import 'dart:ffi';

import 'package:dinamu_paha/Screens/signIn.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../Component/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String firstName = "";
  String lastName = "";
  DateTime? dob;
  String email = "";
  String mobileNumber = "";
  String homeDistrict = "";
  String devisionalSector = "";
  String examinationYear = "";
  String password = "";
  String confirmPassword = "";
  String school = "";
  String districtOfSchool = "";


  Future save() async{
    print(firstName+" "+lastName);
    String formattedDob = DateFormat('yyyy.mm.dd').format(DateTime.now());
    print(formattedDob);
    final res = await http.post( Uri.parse('http://192.168.56.1:8080/user/signup'),
        headers:{'Content-Type':'application/json'},
        body:json.encode({'firstName' : firstName,
                          'lastName' : lastName,
                          'dob' : formattedDob,
                          'email' : email,
                          'mobileNumber' : mobileNumber,
                          'homeDistrict' : homeDistrict,
                          'divisionalSecretory' : devisionalSector,
                          'examinationYear' : examinationYear,
                          'password' : password,
                          'school' : school,
                          'districtOfSchool' : districtOfSchool})
                        );
    print(res.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img_10.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              // height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.formBgColor.withOpacity(0.75),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomRight: Radius.circular(100),)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-60,
                            padding: EdgeInsets.fromLTRB(0, 35.0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Create Account',style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900,color: Colors.black,),),
                              ],
                            ),
                          ),
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
                              controller: TextEditingController(text: firstName),
                              onChanged: (val){
                                this.firstName = val;
                              },
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
                              controller: TextEditingController(text: lastName),
                              onChanged: (val){
                                this.lastName = val;
                              },
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
                                dob = value;
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
                              controller: TextEditingController(text: email),
                              onChanged: (val){
                                this.email = val;
                              },
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
                              controller: TextEditingController(text: mobileNumber),
                              onChanged: (val){
                                this.mobileNumber = val;
                              },
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
                              controller: TextEditingController(text: homeDistrict),
                              onChanged: (val){
                                this.homeDistrict = val;
                              },
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
                              controller: TextEditingController(text: devisionalSector),
                              onChanged: (val){
                                this.devisionalSector = val;
                              },
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
                              controller: TextEditingController(text: examinationYear),
                              onChanged: (val){
                                this.examinationYear = val;
                              },
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
                            child: Text('Password',style: TextStyle(fontSize: 19,color: Colors.black,),),
                          ),
                          Container(
                            height: 33,
                            width: MediaQuery.of(context).size.width-60,
                            child: TextField(
                              controller: TextEditingController(text: password),
                              onChanged: (val){
                                this.password = val;
                              },
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
                            child: Text('Confirm Password',style: TextStyle(fontSize: 19,color: Colors.black,),),
                          ),
                          Container(
                            height: 33,
                            width: MediaQuery.of(context).size.width-60,
                            child: TextField(
                              controller: TextEditingController(text: confirmPassword),
                              onChanged: (val){
                                this.confirmPassword = val;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black),
                                ) ,
                                icon: Icon(Icons.lock_person_outlined,size: 20,color: Colors.black,),
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
                              controller: TextEditingController(text: school),
                              onChanged: (val){
                                this.school = val;
                              },
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
                              controller: TextEditingController(text: districtOfSchool),
                              onChanged: (val){
                                this.districtOfSchool = val;
                              },
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
                            child: Column(
                              children: [
                                Container(
                                  child: Text('By signing up, you agree to our',style: TextStyle(fontSize: 15,color: Colors.black,),),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text('Terms & Conditions ',style: TextStyle(fontSize: 15,color: Colors.blue,),),
                                      ),
                                      Container(
                                        child: Text('and',style: TextStyle(fontSize: 15,color: Colors.black,),),
                                      ),
                                      Container(
                                        child: Text(' Privacy Policy',style: TextStyle(fontSize: 15,color: Colors.blue,),),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap:() {
                              save();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width-60,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.btnColor,
                              ),
                              child: Center(
                                  child: Text('Sign Up',style: TextStyle(fontSize: 20,color: Colors.black,),)),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width-60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text('Already have an account?',style: TextStyle(fontSize: 15),),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => SignInPage(),
                                        ));
                                  },
                                  child: Container(
                                    child: Text(' Login Now',style: TextStyle(fontSize: 15, color: Colors.blue),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
        ),
        ),
      ),
    );
  }
}
