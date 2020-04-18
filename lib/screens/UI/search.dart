import 'package:flutter/material.dart';
import 'package:volo/services/alphaVantage.dart';
import 'package:volo/services/auth.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'botNavBar.dart';
import 'package:volo/services/timeSeries.dart';

Color bg = Color(0xFF282a36);

class Search extends StatelessWidget {
  final AuthService _auth = AuthService();
  final AlphaVantage _vantage = AlphaVantage();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: Text("SEARCH"),
                  onPressed: () async {
                    await _vantage.getTimeSeries("NFLX");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
