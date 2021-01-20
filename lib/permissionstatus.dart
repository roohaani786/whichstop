import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class PermissionStatusWidget extends StatefulWidget {
  const PermissionStatusWidget({Key key}) : super(key: key);

  @override
  _PermissionStatusState createState() => _PermissionStatusState();
}

class _PermissionStatusState extends State<PermissionStatusWidget> {
  final Location location = Location();

  PermissionStatus _permissionGranted;

  @override
  initState() {
   _checkPermissions();
   _requestPermission();
    super.initState();
  }


  Future<void> _checkPermissions() async {
    final PermissionStatus permissionGrantedResult =
    await location.hasPermission();
    setState(() {
      _permissionGranted = permissionGrantedResult;
    });
    if(permissionGrantedResult == false){
      return SnackBar(content: Text("Oe"));
    }
  }



  Future<void> _requestPermission() async {
    if (_permissionGranted != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
      await location.requestPermission();
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
      if(permissionRequestedResult ==PermissionStatus.denied){

        showDialog(context: context,builder: (context){
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("App can't function without this permission"),
                  RaisedButton(onPressed: (){
                    SystemNavigator.pop();
                  },
                  child: Text("OK"),)
                ],
              ),
            ),
          );
        });
        // SystemNavigator.pop();
      }
      }
    }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Permission status: ${_permissionGranted ?? "unknown"}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
      (PermissionStatus.denied == _permissionGranted)?
      Text("Denied"):Text("OOh"),
        ],
      );
  }
}