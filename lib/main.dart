import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_app/data.dart';
import 'package:my_app/listPage.dart';

import 'listPage.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    LocationsAll locations = LocationsAll();
    return Scaffold(
        appBar: AppBar(
          title: Text('my app'),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "username",
                    labelText: "username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "password",
                      labelText: "password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ))),
            ElevatedButton(
                onPressed: () {
                  print(locations.listobj.length);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListPage(locations)));
                },
                child: Text(
                  'press me',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        )));
  }
}
