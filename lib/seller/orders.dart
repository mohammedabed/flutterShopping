import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order_details.dart';


class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Orders'),
        ),
        body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(' T-Shirt'),
                        Text(
                          '',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          "\$54",
                          style: TextStyle(color: Colors.green),
                        ),
                        Text('Client Name'),
                        Text('City'),
                      ],
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderDetails(),
                            ),
                          );
                        },
                        color: Colors.greenAccent[400],
                        child: Text(
                          'Details',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        elevation: 8,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
