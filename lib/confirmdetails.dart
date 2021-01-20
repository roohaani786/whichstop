import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'album.dart';

class ConfirmDetails  extends StatefulWidget{
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String country;
  String dob;
  String customer_type;
  ConfirmDetails({this.firstName,this.lastName,this.email,this.password,this.phoneNumber,this.country,this.dob,this.customer_type});
  @override
  _ConfirmDetailsState createState() => _ConfirmDetailsState(firstName: firstName,lastName: lastName,email: email,password:password,phoneNumber: phoneNumber,dob: dob,country: country,customer_type: customer_type);
}

class _ConfirmDetailsState extends State<ConfirmDetails> {

  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String password;
  String country;
  String dob;
  String customer_type;

  _ConfirmDetailsState({this.firstName,this.lastName,this.email,this.password,this.phoneNumber,this.country,this.dob,this.customer_type});

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
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
                child: Text("Please Confirm the details below",style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("First Name",style: TextStyle(
                      color: Colors.white
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:Text(firstName,style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),


              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Last Name",style: TextStyle(
                        color: Colors.white
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:Text(lastName,style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),


              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Email",style: TextStyle(
                        color: Colors.white
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:Text(email,style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Phone Number",style: TextStyle(
                        color: Colors.white
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:Text(phoneNumber,style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Date of Birth",style: TextStyle(
                        color: Colors.white
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:Text(dob,style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Country",style: TextStyle(
                        color: Colors.white
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:Text(country,style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: RaisedButton(onPressed: (){
                        createAlbum(firstName,lastName,email,password,phoneNumber,country, dob,customer_type);
                      },
                        child: Text("Confirm"),),
                    ),
                  ],
                ),


              )
            ],
          ),
        ),

      ),
    );
  }
}