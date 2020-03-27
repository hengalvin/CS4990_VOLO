import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volo/services/auth.dart';
Color bg = Color(0xFF282a36);

class SignIn extends StatefulWidget {
  final Function state;
  SignIn({this.state});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/wiseowl-transparent.png"),
                height: _iconAnimation.value * 200,
                width: _iconAnimation.value * 200,
                fit: BoxFit.contain,
              ),
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
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: Text("Login"),
                              onPressed: () async {
                                if(_formKey.currentState.validate()){
                                  dynamic result = await _auth.signInWithEmail(email, password);
                                  if(result == null){
                                    setState(() => error = 'Email and Password does not match');
                                  }
                                }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              color: Colors.deepPurpleAccent,
                              textColor: Colors.white,
                              child: Text("Sign Up"),
                              onPressed: () {
                                widget.state();
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                            ),
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.grey),
                            ),
                            FlatButton(
                              textColor: Colors.yellow,
                              child: Text("Sign in as guest"),
                                onPressed: () async {
                                  dynamic result = await _auth.signInAnon();
                                  if(result == null){
                                    print('error signing in');
                                  } else {
                                    print('signed in');
                                    print(result.uid);
                                  }
                                }
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
