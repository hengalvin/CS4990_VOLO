import 'package:flutter/material.dart';
import 'package:volo/screens/authenticate/signUp.dart';
import 'package:volo/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool isSignedIn = true;
  void toggleView() {
    setState(() => isSignedIn = !isSignedIn);
  }
  @override
  Widget build(BuildContext context) {
    if(isSignedIn == true) {
      return SignIn(state: toggleView);
    } else {
      return SignUp(state: toggleView);
    }
  }
}
