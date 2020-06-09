import 'package:flutter/material.dart';
import 'package:untitled11/DB/button.dart';
import 'package:untitled11/DB/radio.dart';


import 'add.dart';
import 'my_order.dart';

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Confirm order'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MyRadio(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyButton(
                  text: 'Add Address',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAddress(),
                        ));
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                MyButton(
                  text: 'Confirm',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyOrder(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 8,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
