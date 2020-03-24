import 'package:flutter/material.dart';
import 'package:volo/services/auth.dart';

Color bg = Color(0xFF282a36);

class SignUp extends StatefulWidget {
  final Function state;
  SignUp({this.state});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fName = '';
  String lName = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ))),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "First Name",
                          ),
                          keyboardType: TextInputType.text,
                          validator: (val) => val.isEmpty ? 'Enter First Name' : null,
                          onChanged: (val) {
                            setState(() => fName = val);
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Last Name",
                          ),
                          keyboardType: TextInputType.text,
                          validator: (val) => val.isEmpty ? 'Enter Last Name' : null,
                          onChanged: (val) {
                            setState(() => lName = val);
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) => val.isEmpty ? 'Enter Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: (val) => val.length < 8 ? 'Password must containt at least 8 characters' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          color: Colors.deepPurpleAccent,
                          textColor: Colors.white,
                          child: Text("Sign Up"),
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                              dynamic result = await _auth.signUpWithEmail(email, password);
                              if(result == null){
                                setState(() => error = 'Enter a valid Email');
                              }
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
//                            Padding(
//                              padding: const EdgeInsets.only(left: 30.0),
//                            ),
                            Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            FlatButton(
                              padding: EdgeInsets.all(0),
                              textColor: Colors.teal,
                              child: Text("Sign in"),
                              onPressed: () {
                                widget.state();
                              },
                            ),
                          ],
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Color(0xFFFF5555), fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
