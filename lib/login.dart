import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:machine_task/register.dart';
import 'package:machine_task/welcome.dart';

import 'album.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  Future<Album> createAlbumX(String email,String password) async {
    final http.Response response = await http.post(
        'https://which-stop.alkurn.co.in/api/login',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }));



    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("Loggedin Successfully!");
      return Album.fromJson(jsonDecode(response.body));
    }
    else if (response.statusCode == 404) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("Email not Verified");
      // return Album.fromJson(jsonDecode(response.body));
    }
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }


  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  Future<Album> _futureAlbum;

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    // TODO: implement build
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/topbg.png"), fit: BoxFit.cover),
              ),
              height: MediaQuery.of(context).size.height/2,
              child: Image.asset("assets/text1.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0,left: 5.0),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                            color:Colors.red,
                            border: Border.all(
                              color: Colors.red[200],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(translate("language.guest"),style: TextStyle(
                            color: Colors.white
                          ),),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                          child: Text(translate("language.login"),style:
                          TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Register()));
                          },
                          child: Container(
                            height: 40.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                color:Colors.red,
                                border: Border.all(
                                  color: Colors.red[200],
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(translate("language.register"),style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text((translate("language.loginwelcome")),
                      style: TextStyle(
                          fontSize: 11.0
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                        key: _loginFormKey,
                        // autovalidateMode: AutovalidateMode.always,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [



                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                controller: emailInputController,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  labelText: translate("language.email"),
                                  labelStyle:
                                  TextStyle(color: Colors.redAccent),
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'johndoe@gmail.com',
                                  hintStyle: TextStyle(color: Colors.black),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.blue)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.redAccent)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                obscureText: true,
                                controller: pwdInputController,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  labelText: translate("language.password"),
                                  labelStyle:
                                  TextStyle(color: Colors.redAccent),
                                  contentPadding: EdgeInsets.all(12),
                                  hintStyle: TextStyle(color: Colors.black),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.blue)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: Colors.redAccent)),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),

                  RaisedButton(onPressed: (){
    if(emailInputController.text != null){
    if(pwdInputController !=null){

    _futureAlbum = createAlbumX(emailInputController.text,pwdInputController.text);
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Welcome(futureAlbum: _futureAlbum,)));
    }}
    else{
    showDialog(context: context,
    child: AlertDialog(
    title: Text("vohoo"),
    ));
    }
    print(_futureAlbum);
    },

                    child: Text(translate("language.confirm")),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}