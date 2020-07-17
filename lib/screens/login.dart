import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/services/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    auth.getUser.then((user) => {
          if (user != null)
            {Navigator.pushReplacementNamed(context, "/profile")}
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterLogo(size: 150),
              Text(
                "Login to start",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text("Be cool"),
              LoginButton(
                  text: "Login With Google",
                  icon: FontAwesomeIcons.google,
                  color: Colors.black,
                  loginMethod: auth.googleSignIn),
              FlatButton(
                child: Text(
                  "Continue as Guest",
                  style: TextStyle(color: Colors.white54),
                ),
                onPressed: auth.anonLogin,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  LoginButton({this.text, this.icon, this.color, this.loginMethod});

  final String text;
  final IconData icon;
  final Color color;
  final Function loginMethod;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: FlatButton.icon(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        label: Text(text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        icon: Icon(icon),
        color: color,
        onPressed: () async {
          var user = await loginMethod();
          if (user != null) {
            Navigator.pushReplacementNamed(context, "/profile");
          }
        },
      ),
    );
  }
}
