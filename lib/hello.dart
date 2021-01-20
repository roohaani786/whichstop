import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:machine_task/whoareu.dart';

class Hello extends StatelessWidget{
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
                Text("Choose Language",style:
                  TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Select your preferred language",
                  style: TextStyle(
                    fontSize: 11.0
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 40.0,
                    width: 140.0,
                    decoration: BoxDecoration(
                        color:Colors.white,
                        border: Border.all(
                          color: Colors.red[200],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: FlatButton(onPressed: (){
                      changeLocale(context, "ar");
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Who()));
                    },child: Text(translate("عربى"),style:
                    TextStyle(color: Colors.red,
                    fontWeight: FontWeight.bold),),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 40.0,
                    width: 140.0,
                    decoration: BoxDecoration(
                      color:Colors.red,
                        border: Border.all(
                          color: Colors.red[200],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: FlatButton(onPressed: (){
                      changeLocale(context, "en");
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Who()));
                    },child: Text("English",style:
                      TextStyle(color: Colors.white),),),
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