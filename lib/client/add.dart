import 'package:flutter/material.dart';
import 'package:untitled11/DB/button.dart';
import 'package:untitled11/seller/add_products.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: Text('Add Address'),),
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            NewTextField(
              hintText: 'Name',
            ),
            NewTextField(
              hintText: 'Address Lane',
            ),
            NewTextField(
              hintText: 'City',
            ),
            NewTextField(
              hintText: 'Postal Code',
            ),
            SizedBox(
              height: 8,
            ),
            NewTextField(
              hintText: 'Phone Number',
            ),
            SizedBox(
              height: 16,
            ),
            MyButton(
              text: 'Add Address',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
