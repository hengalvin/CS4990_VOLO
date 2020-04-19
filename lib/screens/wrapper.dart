import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volo/models/user.dart';
import 'package:volo/screens/authenticate/authenticate.dart';
import 'package:volo/screens/authenticate/signUp.dart';
import 'package:volo/screens/UI/home.dart';
import 'package:volo/screens/UI/botNavBar.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return home or authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return botNavBar();
    }
  }
}
