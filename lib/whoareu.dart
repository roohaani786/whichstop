import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'login.dart';

class Who extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    // TODO: implement build
    return Scaffold(
      body:Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/topbg.png"), fit: BoxFit.cover),
            ),
            height: MediaQuery.of(context).size.height/2,
            child: Image.asset("assets/text1.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Text(translate('language.you_are'),style:
                TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 40.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        color:Colors.white,
                        border: Border.all(
                          color: Colors.red[200],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: FlatButton(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                    },child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.0,
                          child: Image.asset("assets/programmer.png",
                          fit: BoxFit.fill,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(translate("language.user"),style:
                          TextStyle(color: Colors.red,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 40.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        color:Colors.white,
                        border: Border.all(
                          color: Colors.red[200],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: FlatButton(onPressed: (){
                    },child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30.0,
                          child: Image.asset("assets/foodtruck.png",
                            fit: BoxFit.fill,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(translate("language.foodtruckowner"),style:
                          TextStyle(color: Colors.red,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}