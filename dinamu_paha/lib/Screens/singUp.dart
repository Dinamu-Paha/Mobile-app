import 'dart:convert';
import 'dart:core';

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
  DateTime? dob1;
  String email = "";
  String mobileNumber = "";
  String homeDistrict = "";
  String devisionalSector = "";
  String examinationYear = "";
  String examinationYear1 = "";
  String password = "";
  String confirmPassword = "";
  String school = "";
  String districtOfSchool = "";


  Future save() async{
    print(firstName+" "+lastName);
    // String formattedDob = DateFormat('yyyy.mm.dd').format(DateTime.now());
    // print(formattedDob);
    final res = await http.post( Uri.parse('http://192.168.56.1:8080/user/signup'),
        headers:{'Content-Type':'application/json'},
        body:json.encode({'firstName' : firstName,
          'lastName' : lastName,
          'dob' : dob1,
          'email' : email,
          'mobileNumber' : mobileNumber,
          'homeDistrict' : selectedHomeDistrict,
          'divisionalSecretory' : selectedDivision,
          'examinationYear' : selectedExaminationYear,
          'password' : password,
          'school' : school,
          'districtOfSchool' : selectedExaminationYear})
    );
    print(res.body);
    // print(firstName+" "+lastName+" "+dob.toString()+" "+email+" "+mobileNumber+" "+selectedHomeDistrict+" "+
    // selectedDivision+" "+selectedExaminationYear+" "+password+" "+confirmPassword+" "+school+" "+selectedSchoolOfDistrict);

  }
  var _thisYear = DateTime.now().year;

  //dropdown of district and divisional sectors
  List<DropdownMenuItem<String>> get dropdownYear{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("${_thisYear}"),value: "${_thisYear}"),
      DropdownMenuItem(child: Text("${_thisYear+1}"),value: "${_thisYear+1}"),
      DropdownMenuItem(child: Text("${_thisYear+2}"),value: "${_thisYear+2}"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownDistrict{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Colombo"),value: "Colombo"),
      DropdownMenuItem(child: Text("Gampaha"),value: "Gampaha"),
      DropdownMenuItem(child: Text("Kalutara"),value: "Kalutara"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownDivision{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Colombo"),value: "Colombo"),
      DropdownMenuItem(child: Text("Dehiwala"),value: "Dehiwala"),
      DropdownMenuItem(child: Text("Homagama"),value: "Homagama"),
    ];
    return menuItems;
  }

  String selectedHomeDistrict = "Colombo";
  String selectedSchoolOfDistrict = "Colombo";
  String selectedDivision = "Colombo";
  String selectedExaminationYear = "2022";


//password show
  bool _obscureText = true;

  //validation
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneCapital = false;

  onPasswordChanged(String password) {
    final capitalRegex = RegExp(r'[A-Z]');

    setState(() {
      this.password = password;
      _isPasswordEightCharacters = false;
      if(password.length >= 8)
        _isPasswordEightCharacters = true;

      _hasPasswordOneCapital = false;
      if(capitalRegex.hasMatch(password))
        _hasPasswordOneCapital = true;
    });
  }

  //Success Popup
  Future<void> openSuccessDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      child: Text(
                        "Email verification",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Please enter the verification code"),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 35,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: 'Verification Code',
                                border: OutlineInputBorder(),
                                contentPadding:
                                EdgeInsets.only(left: 10.0, top: 5.0),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color:
                                    Color(0xFF4B506D).withOpacity(0.4)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColor.btnColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                      "Resend",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColor.btnColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          ),




                        ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
                              keyboardType: TextInputType.name,
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
                              keyboardType: TextInputType.name,
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
                              keyboardType: TextInputType.emailAddress,
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
                            height: 55,
                            width: MediaQuery.of(context).size.width-60,
                            child: TextField(
                              maxLength: 10,
                              keyboardType: TextInputType.phone,
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
                          // SizedBox(height: 10,),
                          Container(
                            child: Text('Home District',style: TextStyle(fontSize: 19,color: Colors.black,),),
                          ),
                          Row(
                            children: [
                              Icon(Icons.home_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 33,
                                width: MediaQuery.of(context).size.width-90,
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: selectedHomeDistrict,
                                  items: dropdownDistrict,
                                  onChanged: (String? val) {
                                    setState(() {
                                      selectedHomeDistrict = val! ;
                                    });

                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25,),
                          Container(
                            child: Text('Divisional Secretary',style: TextStyle(fontSize: 19,color: Colors.black,),),
                          ),
                          Row(
                            children: [
                              Icon(Icons.home_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 33,
                                width: MediaQuery.of(context).size.width-90,
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: selectedDivision,
                                  items: dropdownDivision,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedDivision = value! ;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25,),
                          Container(
                            child: Text('Examination Year',style: TextStyle(fontSize: 19,color: Colors.black,),),
                          ),
                          Row(
                            children: [
                              Icon(Icons.home_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 33,
                                width: MediaQuery.of(context).size.width-90,
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: selectedExaminationYear,
                                  items: dropdownYear,
                                  onChanged: (String? val1) {
                                    setState(() {
                                      selectedExaminationYear = val1! ;
                                    });
                                  },
                                ),
                              ),
                            ],
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
                              onSubmitted: (val2) {
                                onPasswordChanged(val2);
                              },
                              // onChanged: (val){
                              //   onPasswordChanged(val);
                              // },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: _obscureText
                                      ? Icon(
                                    Icons.visibility_off,
                                    color: AppColor.appBColor,
                                  )
                                      : Icon(
                                    Icons.visibility,
                                    color: AppColor.blckColor,
                                  ),
                                  onPressed: () {
                                    setState(() => _obscureText = !_obscureText);
                                  },
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black),
                                ) ,
                                icon: Icon(Icons.lock_open,size: 20,color: Colors.black,),
                              ),
                              obscureText: _obscureText,
                            ),
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: _isPasswordEightCharacters ?  Colors.green : Colors.transparent,
                                    border: _isPasswordEightCharacters ? Border.all(color: Colors.transparent) :
                                    Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                              ),
                              SizedBox(width: 10,),
                              Text("Contains at least 8 characters")
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: _hasPasswordOneCapital ?  Colors.green : Colors.transparent,
                                    border: _hasPasswordOneCapital ? Border.all(color: Colors.transparent) :
                                    Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                              ),
                              SizedBox(width: 10,),
                              Text("Contains at least Capital letter")
                            ],
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
                                suffixIcon: IconButton(
                                  icon: _obscureText
                                      ? Icon(
                                    Icons.visibility_off,
                                    color: AppColor.appBColor,
                                  )
                                      : Icon(
                                    Icons.visibility,
                                    color: AppColor.blckColor,
                                  ),
                                  onPressed: () {
                                    setState(() => _obscureText = !_obscureText);
                                  },
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black),
                                ) ,
                                icon: Icon(Icons.lock_person_outlined,size: 20,color: Colors.black,),
                              ),
                              obscureText: _obscureText,
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
                          Row(
                            children: [
                              Icon(Icons.home_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 33,
                                width: MediaQuery.of(context).size.width-90,
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: selectedSchoolOfDistrict,
                                  items: dropdownDistrict,
                                  onChanged: (String? val) {
                                    setState(() {
                                      selectedSchoolOfDistrict = val! ;
                                    });

                                  },
                                ),
                              ),
                            ],
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
                              openSuccessDialog();
                              // save();
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
