import 'package:flutter/material.dart';

class LLoginScreen1 extends StatefulWidget {
  @override
  _LLoginScreen1State createState() => _LLoginScreen1State();
}

class _LLoginScreen1State extends State<LLoginScreen1> {
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    return GridView.count(
      crossAxisCount: 2,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.5,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  child: Image.asset(
                    "1.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 48.0),
                emailField,
                SizedBox(height: 24.0),
                passwordField,
                SizedBox(
                  height: 36.0,
                ),
                loginButton,
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/*
**********
**********
**********
**********
*** END***
**********
**********
**********
**********
 */
