import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

import 'album.dart';
import 'confirmdetails.dart';

class Register extends StatefulWidget{
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Future<Album> _futureAlbum;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController emailInputController;
  TextEditingController phoneNumberController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;
  TextEditingController countryController;
  TextEditingController dobController;

  @override
  initState() {
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    phoneNumberController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    countryController = new TextEditingController();
    dobController = new TextEditingController();
    super.initState();
  }

  bool errordikhao = false;



  Future<Album> createAlbum(String firstname, String lastname, String emailaddress, String password, String phonenumber, String country, String dob, String user_type) async {

    print(firstname);
    print(lastname);
    print(emailaddress);
    print(password);
    print(phonenumber);
    print(country);
    print(dob);
    print(user_type);

    final http.Response response = await http.post(
      'https://which-stop.alkurn.co.in/api/register',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

    body: jsonEncode(<String, String>{
      'firstname': firstname,
      'lastname': lastname,
      'email': emailaddress,
      'password': password,
      'phone': phonenumber,
      'country': country,
      'dob': dob,
      'user_type': user_type
    }));

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("Data stored Successfully!");
      // return Album.fromJson(jsonDecode(response.body));
    }
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }


  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      setState(() {
        errordikhao = true;
      });
    } else {
      setState(() {
        errordikhao = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    String customer_type = "customer";
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text("Registration",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Create an account with WhichStop?",style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SingleChildScrollView(
                    child: Form(
                        key: _registerFormKey,
                        // autovalidateMode: AutovalidateMode.always,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: firstNameInputController,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                labelText: "First Name",
                                labelStyle:
                                TextStyle(color: Colors.white),
                                contentPadding: EdgeInsets.all(12),
                                hintText: 'John',
                                hintStyle: TextStyle(
                                    color: Colors.white),

                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        color: Colors.white)),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                controller: lastNameInputController,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Last Name",
                                  labelStyle:
                                  TextStyle(color: Colors.white),
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'Doe',
                                  hintStyle: TextStyle(
                                      color: Colors.white),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                controller: emailInputController,
                                validator: emailValidator,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Email address",
                                  labelStyle:
                                  TextStyle(color: Colors.white),
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'johndoe@gmail.com',
                                  hintStyle: TextStyle(
                                      color: Colors.white),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                controller: phoneNumberController,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  labelStyle:
                                  TextStyle(color: Colors.white),
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: '9427898945',
                                  hintStyle: TextStyle(
                                      color: Colors.white),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                controller: pwdInputController,
                                obscureText: true,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle:
                                  TextStyle(color: Colors.white),
                                  contentPadding: EdgeInsets.all(12),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                controller: confirmPwdInputController,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Confirm Password",
                                  labelStyle:
                                  TextStyle(color: Colors.white),
                                  contentPadding: EdgeInsets.all(12),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                controller: dobController,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Date of Birth",
                                  labelStyle:
                                  TextStyle(color: Colors.white),
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: '12/09/1981',
                                  hintStyle: TextStyle(
                                      color: Colors.white),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                controller: countryController,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Country",
                                  labelStyle:
                                  TextStyle(color: Colors.white),
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'India',
                                  hintStyle: TextStyle(
                                      color: Colors.white),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              RaisedButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ConfirmDetails(firstName: firstNameInputController.text,lastName: lastNameInputController.text,email: emailInputController.text,password:pwdInputController.text,phoneNumber: phoneNumberController.text,country: countryController.text,dob: dobController.text,customer_type: customer_type,)));
                // createAlbum(firstNameInputController.text,lastNameInputController.text,emailInputController.text,pwdInputController.text,phoneNumberController.text,countryController.text, dobController.text,customer_type);
                print("here is $_futureAlbum".toString());
              },
                color: Colors.white,
              child: Text("Continue",style:
                TextStyle(
                  color: Colors.red,
                ),),),

            ],
          ),
        ),
      ),
    );
  }
}