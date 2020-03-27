class TimeSeries {
  final String date;
  final double open;
  final double close;

  TimeSeries({this.date, this.open, this.close});

  factory TimeSeries.fromJson(Map<String, dynamic> json) {
    return TimeSeries(
//      date: json[''],
      open: double.parse(json['1. open']),
      close: double.parse(json['4. close']),
    );
  }
}