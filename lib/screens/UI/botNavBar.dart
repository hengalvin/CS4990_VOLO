import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'home.dart';
import 'package:volo/services/alphaVantage.dart';
import 'profile.dart';

class botNavBar extends StatefulWidget {
  @override
  _botNavBarState createState() => _botNavBarState();
}

class _botNavBarState extends State<botNavBar> {
  Color white = Color(0xFFf8f8f2);
  AlphaVantage _vantage = new AlphaVantage();
  List<String> data = [];
  List<double> info = [];
  int _currentIndex = 0;
  final _pages = [
    Home(),
    Profile(),
  ];
  bool loading = false;
  bool searching = false;
  String searchItem = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: !searching
              ? Text("Volo")
              : TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search ",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  onSubmitted: (val) async {
                    data.clear();
                    info.clear();
                    data = await _vantage.search(val);
                    Future.delayed(Duration(seconds: 3),
                        () async => info = await _vantage.getDaily(data[1]));
                    Future.delayed(
                        Duration(seconds: 5), () => _infoModal(context));
                  },
                ),
          backgroundColor: Color(0xFF43464B),
          actions: <Widget>[
            searching
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        this.searching = false;
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.searching = true;
                      });
                    })
          ],
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              this.searching = false;
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

  void _infoModal(context) async {
    showModalBottomSheet(
        backgroundColor: Color(0xFF282a36),
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.60,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "More Info: (Daily)",
                            style: TextStyle(
                                fontSize: 18, color: Colors.orangeAccent),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.cancel,
                                color: Colors.redAccent, size: 20),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                      ),
                      Text(
                        data[0] + " (" + data[1] + ")",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: draw(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                      ),
                      Container(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Open: \$" + info[3].toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              "Close: \$" + info[0].toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                      ),
                      Container(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "High: \$" + info[1].toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              "Low: \$" + info[2].toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  Widget draw() {
    List<double> open = new List.from(info.sublist(3).reversed);
    Color x;
    if (open[49] - open[48] < 0) {
      x = Color(0xffff5555);
    } else {
      x = Color(0xff50fa7b);
    }
    return Center(
      child: new Container(
        width: 350,
        height: 150,
        child: new Sparkline(
          data: open,
          lineColor: x,
        ),
      ),
    );
  }
}
