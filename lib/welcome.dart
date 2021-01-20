import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_task/getlocation.dart';
import 'package:machine_task/permissionstatus.dart';

import 'album.dart';

class Welcome extends StatefulWidget{
   Future<Album> futureAlbum;
   Welcome({this.futureAlbum});
  @override
  _WelcomeState createState() => _WelcomeState(futureAlbum: futureAlbum);
}

class _WelcomeState extends State<Welcome> {
  Future<Album> futureAlbum;
  _WelcomeState({this.futureAlbum});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/topbg.png"), fit: BoxFit.cover),
    ),
    height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,child: (futureAlbum == null)
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("hello"),

        ],
      )
          : FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data.status == 404){
              return Center(child: Text("Please first verify your email !",
                  style:
                  TextStyle(color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),));
            }
            else{
              return Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: const <Widget>[
                    PermissionStatusWidget(),
                    Divider(height: 32),
                    GetLocationWidget(),


                Center(child: Text("Welcome",style:
                TextStyle(color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),)),
                  ],
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      ),
    );
  }
}