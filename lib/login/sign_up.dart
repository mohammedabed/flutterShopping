import 'package:flutter/material.dart';
import 'package:untitled11/DB/button.dart';
import 'package:untitled11/DB/users_db.dart';
import 'package:untitled11/model/users.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<String> items = <String>['Client', 'Seller'];
  String selectedItem = 'Client';
  var name;

  var email;

  var password;

  var user;
  UserDatabase userDatabase = UserDatabase();

  @override
  Widget build(BuildContext context) {
    user =
        User(name: name, email: email, type: selectedItem, password: password);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 58),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) => name = value,
                  cursorRadius: Radius.circular(3),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Full Name',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => email = value,
                  cursorRadius: Radius.circular(3),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) => password = value,
                  obscureText: true,
                  cursorRadius: Radius.circular(3),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            DropdownButton<String>(
              value: selectedItem,
              onChanged: (String string) =>
                  setState(() => selectedItem = string),
              selectedItemBuilder: (BuildContext context) {
                return items.map<Widget>((String item) {
                  return Text(item);
                }).toList();
              },
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  child: Text('$item'),
                  value: item,
                );
              }).toList(),
            ),
            SizedBox(
              height: 16,
            ),
            MyButton(
              text: "Sing Up",
              onPressed: _save,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?"),
                FlatButton(
                  child: Text("Sign in"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _save() async {
    var s = await userDatabase.addUser(user);
    print(s);
  }
}
