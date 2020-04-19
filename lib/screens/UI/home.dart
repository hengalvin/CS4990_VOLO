import 'package:flutter/material.dart';
import 'package:volo/services/alphaVantage.dart';
import 'package:volo/services/auth.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

Color bg = Color(0xFF282a36);

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final AlphaVantage _vantage = AlphaVantage();
  List<double> _mmm = [147.44, 145.27, 148.19, 149.62, 147.5, 148.46, 145.73, 147.5, 137.86, 136.01, 132.36, 132.0, 135.69, 132.25, 132.83, 131.79, 133.15, 122.29,
    128.16, 138.07, 137.71, 128.46, 131.94, 129.86, 141.01, 139.96, 149.73, 149.02, 146.59, 149.59, 150.8, 147.02, 152.44, 151.34, 154.09, 151.23, 149.57, 153.31, 154.45,
    158.33, 159.0, 159.08, 160.36, 159.85, 161.76, 164.24, 161.0, 160.21, 161.41, 164.49];
  List<double> _csco = [42.25, 41.76, 42.2028, 41.91, 41.04, 42.09, 41.17, 42.66, 40.46, 39.82, 37.84, 38.17, 40.13, 39.45, 39.21, 37.97, 38.65, 36.405, 35.51, 38.27,
    37.05, 33.76, 34.7, 33.23, 35.18, 34.5, 39.02, 39.2478, 36.9, 38.0, 40.17, 40.72, 41.233, 40.26, 38.7, 41.28, 42.97, 44.05, 45.0, 46.73, 46.09, 46.69, 46.82, 47.16, 47.15,
    49.43, 49.39, 47.99, 48.6, 48.69];
  List<double> _aapl = [284.69, 287.38, 282.4, 280.0, 268.31, 268.7, 262.74, 270.8, 250.9, 242.8, 240.34, 246.5, 255.6, 250.74, 252.75, 246.52, 250.75, 236.36, 228.08,
    247.18, 247.385, 239.77, 247.51, 241.95, 264.89, 255.94, 277.39, 277.14, 263.75, 282.0, 295.52, 296.44, 303.67, 282.28, 257.26, 281.1, 286.53, 300.95, 297.26, 318.62, 322.63,
    320.0, 315.36, 324.73, 324.19, 321.47, 323.6, 314.18, 322.37, 322.57];
  List<double> _ba = [149.41, 141.46, 139.0, 150.51, 155.5, 154.71, 147.51, 162.0, 133.7, 125.0, 128.51, 138.91, 155.0, 153.81, 172.0, 172.29, 154.9, 123.68, 98.75, 99.85, 98.8,
    99.86, 132.51, 149.42, 174.97, 160.53, 222.99, 237.0, 238.0035, 253.7, 275.79, 284.55, 292.0, 279.54, 278.07, 300.37, 307.0, 318.26, 320.0, 334.05, 338.29, 338.12, 338.77, 342.3,
    344.32, 346.42, 347.64, 337.22, 340.37, 330.91];
  List<double> _cat = [114.45, 111.85, 112.96, 116.5, 119.95, 128.65, 122.99, 122.89, 120.04, 115.5, 111.23, 112.09, 110.73, 106.33, 104.43, 104.85, 101.17, 96.06, 93.9, 103.12, 99.23,
    93.99, 96.01, 89.0, 98.39, 93.5, 103.8, 108.64, 112.99, 119.0, 123.15, 126.07, 127.0, 125.05, 119.57, 125.6, 129.65, 132.97, 132.53, 136.5, 136.26, 136.79, 137.46, 139.49, 140.0, 138.4,
    135.49, 133.04, 136.04, 138.2];
  List<double> _ibm = [119.3, 119.01, 119.12, 123.46, 121.63, 120.48, 116.31, 118.8, 110.35, 108.92, 105.37, 106.36, 112.0, 108.09, 108.58, 106.91, 105.48, 99.99, 94.6, 100.92,
    102.33, 99.41, 100.61, 98.0, 108.68, 109.65, 121.01, 122.78, 120.16, 126.7, 130.5, 131.58, 134.48, 130.75, 129.98, 137.24, 142.9, 146.51, 145.51, 151.04, 150.81, 151.54, 149.79, 154.42,
    154.37, 153.75, 155.12, 152.97, 154.55, 156.82];
  List<double> _mcd = [182.32, 177.0, 178.74, 183.75, 182.68, 180.73, 175.01, 184.53, 169.2, 160.31, 155.0, 160.22, 166.84, 164.92, 162.78, 163.99, 165.0, 149.0, 142.95, 153.59,
    135.2, 137.5, 148.02, 157.1, 178.26, 174.78, 192.94, 190.95, 187.67, 192.9, 202.64, 201.93, 202.0, 193.81, 196.0, 207.7, 212.89, 214.58, 210.58, 215.24, 216.15, 216.81, 215.92, 217.5,
    216.71, 216.0, 214.0, 211.34, 212.56, 214.72];
  Color white = Color(0xFFf8f8f2);


  Material myChart(String title, String name, List<double> lst, Color xx, String priceVal) {
    List<double> open = new List.from(lst.reversed);
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
                  data: open,
                  lineColor: xx,
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
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("GESTURE PRESSED");
                    },
                    child: myChart("MMM", "3M Company", _mmm,  Color(0xff50fa7b), "\$146.46"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("GESTURE PRESSED");
                    },
                    child: myChart("CSCO", "Cisco", _csco,  Color(0xff50fa7b), "\$42.48"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("GESTURE PRESSED");
                    },
                    child: myChart("AAPL", "Apple Inc.", _aapl,  Color(0xffff5555), "\$282.80"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("GESTURE PRESSED");
                    },
                    child: myChart("BA", "Boeing", _ba,  Color(0xff50fa7b), "\$154.00"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("GESTURE PRESSED");
                    },
                    child: myChart("CAT", "Caterpillar", _cat,  Color(0xff50fa7b), "\$116.30"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("GESTURE PRESSED");
                    },
                    child: myChart("IBM", "IBM", _ibm,  Color(0xff50fa7b), "\$120.12"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("GESTURE PRESSED");
                    },
                    child: myChart("MCD", "Mcdonald's", _mcd,  Color(0xff50fa7b), "\$186.10"),
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

