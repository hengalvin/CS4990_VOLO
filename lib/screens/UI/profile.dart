import 'package:flutter/material.dart';
import 'package:volo/services/alphaVantage.dart';
import 'package:volo/services/auth.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'botNavBar.dart';
import 'package:volo/services/timeSeries.dart';

Color bg = Color(0xFF282a36);

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(

                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.deepPurpleAccent,
                    textColor: Colors.white,
                    child: Text("Log out"),
                    onPressed: () async {
                      await _auth.signOut();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
