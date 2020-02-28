import 'package:flutter/material.dart';
Color bg = Color(0xFF282a36);
void main() => runApp(new HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  State createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        backgroundColor: bg,
        bottomNavigationBar: ,
      ),);
  }
}

