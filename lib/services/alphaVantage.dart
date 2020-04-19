import 'package:alpha_vantage_package/alpha_vantage_package.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'search.dart';

class AlphaVantage {
//  final List<String> _DOW = ["MMM","AXP","AAPL","BA","CAT","CVX","CSCO","KO","DOW","XOM","GS","HD","IBM","INTC","JNJ","JPM","MCD","MRK","MSFT","NIKE","PFE","PG","RTX","TRV","UNH","VZ","V","WMT","WBA","DIS"];
  final timeSeries = TimeSeries("7WKQ8TUA60KMBWGO");

  Future search(String stock) async {
    print("Starting get request");
    List<String> data = [];
    http
        .get(
            "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=" +
                stock +
                "&apikey=7WKQ8TUA60KMBWGO")
        .then((res) {
      print("received response.");
      final search = searchFromJson(res.body);
      for (int i = 0; i < search.bestMatches.length; i++) {
        data.add(search.bestMatches[i].the2Name);
        data.add(search.bestMatches[i].the1Symbol);
      }
    }).catchError((e) {
      print("Failed to get response. " + e.toString());
    });
    return data;
  }

  Future getDaily(String stock) async {
    List<double> open = [];
    List<double> info = [];
    JSONObject json = await timeSeries.getDaily(stock);
    var data = json.getJSONMap()["Time Series (Daily)"];
    var data2 = Map<String, dynamic>.from(data);
    var firstKey = data2.keys.toList()[0];

    data2.forEach((k, v) => open.add(double.parse(v["1. open"])));

    info.add(double.parse(data2[firstKey]["4. close"]));
    info.add(double.parse(data2[firstKey]["2. high"]));
    info.add(double.parse(data2[firstKey]["3. low"]));

    for (int i = 0; i < 50; i++) {
      info.add(open[i]);
    }
//    print(info[3]);
//    print(info[0]);
//    print(info[1]);
//    print(info[2]);
    return info;
  }
}
