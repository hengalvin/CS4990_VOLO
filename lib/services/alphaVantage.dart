import 'dart:convert';
import 'package:alpha_vantage_package/alpha_vantage_package.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
//import 'package:volo/services/timeSeries.dart';

class AlphaVantage {

  final timeSeries = TimeSeries("7WKQ8TUA60KMBWGO");
  final List<String> _date = [];
  final List<double> _open = [];

//  Future<TimeSeries> getTimeSeries(String stock) async {
//    print("Starting get request");
//    await http.get("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&apikey=demo").then((res){
//      print("received response.");
////      var resObj = json.decode(res.body);
//    return TimeSeries.fromJson(json.decode(res.body));
//     }).catchError((e) {
//      print("Failed to get response.");
//    });
//  }

  Future getTimeSeries(String stock) async {

      JSONObject json = await timeSeries.getIntraday(stock);
      var data = json.getJSONMap()["Time Series (1min)"];
      //convert to map to get specific data like the amount during close
      var data2 = Map<String, dynamic>.from(data);

//      data2.forEach((k, v) => _date.add(k));
//      print("Date");
//      print(_date);
      print("OPEN");
      data2.forEach((k, v) => _open.add(double.parse(v["1. open"])));
      print(_open);
      //Use get method to search entire json for key for stock
//      expect(json.get("2. Symbol"), stock);

      // Use map to find stock symbol
//      expect(json.getJSONMap()["Meta Data"]["2. Symbol"], stock);
//      print(json.getJSONMap());

  return _open;
  }
}



