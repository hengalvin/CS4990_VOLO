import 'package:flutter/material.dart';
import 'package:volo/models/user.dart';
import 'package:volo/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:volo/services/auth.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
