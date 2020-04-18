import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'profile.dart';

class botNavBar extends StatefulWidget {
  @override
  _botNavBarState createState() => _botNavBarState();
}

class _botNavBarState extends State<botNavBar> {
  Color white = Color(0xFFf8f8f2);

  int _currentIndex = 0;
  final _pages = [
    Home(),
    Profile(),
//    Text('Item 1', style: TextStyle(fontSize: 36),),
//    Text('Item 2', style: TextStyle(fontSize: 36),),
//    Text('Item 3', style: TextStyle(fontSize: 36),),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Color(0xFF43464B),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: white),
              title: Text("Home", style: TextStyle(color: white)),
              activeIcon: Icon(Icons.home, color: Color(0xFF6272a4)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: white),
              title: Text("Profile", style: TextStyle(color: white)),
              activeIcon: Icon(Icons.person, color: Color(0xFF6272a4)),
            ),
          ],
        ),
      ),
    );
  }
}

//Material botNavBar() {
//  return Material(
//    child: BottomNavigationBar(
//      backgroundColor: Color(0xFF43464B),
//      items: [
//        BottomNavigationBarItem(
//          icon: Icon(Icons.home, color: white),
//          title: Text("Home", style: TextStyle(color: white)),
//          activeIcon: Icon(Icons.home, color: Color(0xFF6272a4)),
//        ),
//        BottomNavigationBarItem(
//          icon: Icon(Icons.search, color: white),
//          title: Text("Search", style: TextStyle(color: white)),
//          activeIcon: Icon(Icons.search, color: Color(0xFF6272a4)),
//        ),
//        BottomNavigationBarItem(
//          icon: Icon(Icons.person, color: white),
//          title: Text("Profile", style: TextStyle(color: white)),
//          activeIcon: Icon(Icons.person, color: Color(0xFF6272a4)),
//        ),
//      ],
//    ),
//  );
//}