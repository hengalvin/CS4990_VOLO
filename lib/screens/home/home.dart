//import 'package:alpha_vantage_package/alpha_vantage_package.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:http/http.dart' as http;
//
//Color bg = Color(0xFF282a36);
//Color white = Color(0xFFf8f8f2);
//void main() => runApp(new HomeScreen());
//
//class HomeScreen extends StatefulWidget {
//  @override
//  State createState() => new _HomeScreenState();
//}
//
////async
////
////void _getTimeSeries() {
////  print("Starting get request");
////  http.get("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&apikey=7WKQ8TUA60KMBWGO")
////      .then((res){
////    print("received response.");
////    var resObj = jsonDecode(res.body);
////    print(resObj["Time Series (Daily)"]["2020-03-09"]);
////  }).catchError((e) {
////    print("Failed to get response.");
////  });
////}
//
//void _getTimeSeries() async {
//  test('Intraday', () async {
//    final timeSeries = new TimeSeries("7WKQ8TUA60KMBWGO");
//    //get the hourly time series for Microsoft with to-the-minute updates. You can change this.
//    JSONObject json = await timeSeries.getIntraday("MSFT");
//    var data = json.getJSONMap()["Time Series (1min)"];
//
//    //convert to map to get specific data like the amount during close
//    var data2 = Map<String, dynamic>.from(data);
//    data2.forEach((k, v) => print(v["4. close"]));
//
//    //Use get method to search entire json for key for stock
//    expect(json.get("2. Symbol"), "MSFT");
//
//    // Use map to find stock symbol
//    expect(json.getJSONMap()["Meta Data"]["2. Symbol"], "MSFT");
//    print(json.getJSONMap());
//  });
//}
//
//
//class _HomeScreenState extends State<HomeScreen> {
//  _HomeScreenState() {
//    print("Loading TimeSeries");
//    _getTimeSeries();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    int _currentNav = 0;
//    return new MaterialApp(
//      home: Scaffold(
//        backgroundColor: bg,
//        body: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text("Time Series"),
//              FlatButton(
//                child: Text("sample"),
//                onPressed: _getTimeSeries,
//              )
//            ],
//          ),
//        ),
//        bottomNavigationBar: BottomNavigationBar(
//          currentIndex: _currentNav,
//          backgroundColor: Color(0xFF43464B),
//          items: [
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home, color: white),
//              title: Text("Home", style: TextStyle(color: white)),
//              activeIcon: Icon(Icons.home, color: Color(0xFF6272a4)),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.search, color: white),
//              title: Text("Search", style: TextStyle(color: white)),
//              activeIcon: Icon(Icons.search, color: Color(0xFF6272a4)),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.person, color: white),
//              title: Text("Profile", style: TextStyle(color: white)),
//              activeIcon: Icon(Icons.person, color: Color(0xFF6272a4)),
//            ),
//          ],
//          onTap: (index) {
//            setState(() {
//              _currentNav = index;
//            });
////            _navigateToScreens(index);
//          },
//        ),
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('home'),
    );
  }
}































