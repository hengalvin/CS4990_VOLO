import 'package:flutter/material.dart';
import 'package:volo/services/auth.dart';

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
                Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text:
                            'Third party information provided for product features, communications, and communications emanating from social media communities, market prices, data and other '
                            'information available are meant for informational purposes only and are not intended as an offer or solicitation for the purchase or sale of any financial instrument or '
                            'cryptocurrency or as an official confirmation of any transaction. The information provided is not warranted as to completeness or accuracy and is subject to change without notice.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ))),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text:
                            'Investors should be aware that system response, execution price, speed, liquidity, market data, and account access times are affected by many factors, including '
                            'market volatility, size and type of order, market conditions, system performance, and other factors. All investments involve risk and the past performance of a security, '
                            'or financial product does not guarantee future results or returns. There is always the potential of losing money when you invest in securities, or other financial products. '
                            'Investors should consider their investment objectives and risks carefully before investing.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
