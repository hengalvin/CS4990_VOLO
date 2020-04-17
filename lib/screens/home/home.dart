import 'package:flutter/material.dart';
import 'package:volo/services/alphaVantage.dart';
import 'package:volo/services/auth.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'botNavBar.dart';
import 'package:volo/services/timeSeries.dart';

Color bg = Color(0xFF282a36);

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final AlphaVantage _vantage = AlphaVantage();
  List<double> _nflx = [342.57, 342.91, 342.3148, 343.6191, 342.71, 340.67, 341.39, 340.45, 340.57, 342.0, 343.46, 344.26, 345.03, 345.47, 346.22, 346.6996, 346.95, 346.88, 347.2845, 346.0, 346.926, 346.39, 345.39, 345.63, 345.34, 345.575, 345.41, 346.01, 346.41, 345.635, 345.86, 346.255, 345.58, 346.29, 346.5, 346.145, 346.1497, 346.32, 346.5821, 346.6, 346.83, 347.045, 346.96, 347.15, 347.125, 346.3666, 346.0787, 346.23, 346.3, 347.76, 347.74, 348.4, 348.13, 348.82, 348.8, 348.45, 348.49, 348.56, 348.78, 349.13, 350.06, 350.475, 350.36, 350.875, 349.32, 348.62, 348.52, 348.64, 349.28, 349.01, 349.04, 349.14, 348.6215, 348.9249, 348.485, 347.58, 347.87, 348.0301, 348.4, 348.48, 348.1178, 348.13, 347.84, 348.24, 348.33, 348.11, 348.4981, 348.7221, 348.8257, 349.15, 348.8, 347.9564, 347.42, 347.6, 347.795, 348.0, 348.39, 348.455, 348.575, 348.273];
  List<double> _tsla = [540.72, 541.06, 539.59, 540.76, 538.925, 535.4, 535.81, 536.2, 540.7717, 543.51, 542.2, 543.31, 545.41, 545.4874, 545.14, 546.1, 547.0, 550.75, 550.75, 550.93, 552.35, 551.82, 550.72, 549.62, 548.63, 548.725, 546.7, 546.7111, 548.33, 545.84, 546.745, 546.36, 546.0356, 548.36, 549.03, 549.655, 549.03, 548.05, 547.9, 546.85, 547.86, 548.2712, 548.67, 548.98, 548.97, 549.735, 550.2, 549.64, 549.65, 550.54, 550.01, 550.26, 549.855, 550.15, 552.97, 551.595, 551.2499, 550.0, 549.3043, 550.683, 550.54, 550.7673, 549.4128, 549.87, 547.0819, 545.99, 544.6068, 543.71, 545.0, 544.595, 544.36, 545.3515, 545.0, 544.37, 542.75, 541.9808, 541.16, 540.33, 539.4347, 541.1661, 538.7, 538.6143, 538.9101, 538.33, 538.0, 536.4, 536.495, 537.21, 536.99, 538.83, 537.45, 538.45, 537.05, 538.26, 539.38, 541.78, 542.6, 542.7944, 544.106, 544.07];
  List<double> _msft = [146.14, 147.12, 147.355, 148.26, 148.97, 146.76, 146.59, 147.22, 147.33, 148.82, 148.77, 149.26, 149.5, 149.81, 150.015, 150.34, 150.08, 151.33, 151.32, 151.98, 152.395, 152.21, 152.42, 152.16, 152.36, 152.61, 152.33, 152.55, 152.74, 152.035, 152.16, 152.24, 152.11, 152.97, 152.8154, 152.6587, 152.7769, 152.61, 153.0, 152.98, 152.99, 152.89, 152.64, 152.3886, 152.08, 151.77, 151.82, 152.1, 152.12, 152.31, 152.12, 152.5, 152.41, 152.3501, 152.5762, 152.34, 152.1601, 151.87, 151.84, 151.91, 152.1103, 152.1299, 152.1899, 152.39, 151.61, 151.365, 151.355, 151.69, 152.3, 152.33, 152.23, 152.415, 152.2, 152.11, 151.885, 151.76, 151.8087, 151.72, 151.69, 151.925, 151.49, 151.54, 151.65, 151.64, 151.3775, 151.44, 151.75, 152.18, 152.56, 152.81, 152.96, 152.83, 152.6, 152.66, 152.68, 153.0, 153.3799, 153.54, 153.86, 153.92];
  List<double> _aapl = [
    245.46,
    245.63,
    245.15,
    245.17,
    246.12,
    245.58,
    245.89,
    246.7,
    247.71,
    250.26,
    250.27,
    250.97,
    252.0,
    251.04,
    250.84,
    252.43,
    253.91,
    254.7795,
    256.48,
    256.04,
    256.28,
    256.335,
    256.68,
    256.27,
    256.1833,
    256.48,
    255.615,
    256.02,
    256.27,
    255.345,
    255.34,
    255.25,
    255.15,
    256.4366,
    255.9,
    255.72,
    256.27,
    256.31,
    256.915,
    256.82,
    256.6007,
    256.74,
    256.4287,
    256.1601,
    255.785,
    255.23,
    255.31,
    255.41,
    255.25,
    255.88,
    255.72,
    255.855,
    255.514,
    255.31,
    255.55,
    255.36,
    255.415,
    255.09,
    255.022,
    254.95,
    255.33,
    255.37,
    255.24,
    255.16,
    254.49,
    254.06,
    254.16,
    254.34,
    254.93,
    254.92,
    254.9,
    255.07,
    255.06,
    254.76,
    254.3359,
    254.2525,
    254.17,
    254.3794,
    254.0814,
    254.565,
    253.97,
    254.02,
    254.15,
    254.01,
    253.75,
    253.89,
    254.075,
    254.4342,
    254.64,
    255.03,
    254.9697,
    254.89,
    254.54,
    255.01,
    255.44,
    255.7262,
    255.695,
    255.95,
    255.97,
    255.9
  ];
  Color white = Color(0xFFf8f8f2);

//  Material botNavBar() {
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

  Material myChart(String title, String name, List<double> lst, Color xx, String priceVal) {
    return Material(
      color: Color(0x8044475a),
      elevation: 14.0,
      borderRadius: BorderRadius.circular(10.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 60,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: new Sparkline(
                  data: lst,
                  lineColor: xx,
//                      pointsMode: PointsMode.all,
//                      pointSize: 8.0,
                ),
              ),
            ),
            Container(
              child: Text(
                priceVal,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                ),
//                Padding(
//                  padding: const EdgeInsets.only(top: 10.0),
//                  child: Text(
//                    "HELO",
//                    style: TextStyle(
//                      fontSize: 40.0,
//                      color: Colors.blueAccent,
//                    ),
//                  ),
//                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myChart("AAPL", "Apple", _aapl,  Color(0xff50fa7b), "\$247.52"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myChart("MSFT", "Microsoft", _msft,  Color(0xffff5555), "\$147.93"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: myChart("TSLA", "Tesla", _tsla,  Color(0xff50fa7b), "\$541.03"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myChart("NFLX", "Netflix", _nflx,  Color(0xffff5555), "\$342.00"),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: Text("AAPL"),
                  onPressed: () async {
                    await _vantage.getTimeSeries("NFLX");
                  },
                ),
                RaisedButton(
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
              ],
            ),
          ),
        ),
//        bottomNavigationBar: botNavBar(),
      ),
    );
  }
}
