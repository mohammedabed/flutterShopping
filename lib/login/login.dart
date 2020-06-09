import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled11/DB/button.dart';
import 'package:untitled11/DB/users_db.dart';
import 'package:untitled11/login/sign_up.dart';
import 'package:untitled11/model/users.dart';
import 'package:untitled11/seller/main_seller.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserDatabase userDatabase = UserDatabase();
  var email;

  var password;

  User user;

  @override
  Widget build(BuildContext context) {
    user = User(email: email, password: password);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: ListView(
          padding: EdgeInsets.only(top: 32),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 64),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                onChanged: (value) => email = value,
                cursorRadius: Radius.circular(3),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => password = value,
                obscureText: true,
                cursorRadius: Radius.circular(3),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            MyButton(
              text: "Login",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ControlPanel(),
                    ));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Dont't have an account ?"),
                FlatButton(
                  child: Text("Sign Up"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void getData() async {
    List<User> ss = await userDatabase.users();
    ss.forEach((element) {
      User(name: element.name, type: element.type, email: element.email);
      var s = element.name;
      print(s);
    });
  }
}
