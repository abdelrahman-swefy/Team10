import 'package:flutter/material.dart';
import 'package:my_app/models/location.dart';
import 'package:my_app/screens/home/location_list.dart';
import 'package:my_app/services/auth.dart';
import 'package:my_app/services/database.dart';
import 'package:provider/provider.dart';

import 'formscreen.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return StreamProvider<List<Location>>.value(
        value: DataBaseService().locations,
        child: Scaffold(
            appBar: AppBar(
              title: Text("favlocation"),
              leading: BackButton(onPressed: () {}),
              actions: [
                FlatButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                    },
                    icon: Icon(Icons.logout),
                    label: Text("log out"))
              ],
            ),
            body: LocationList() ?? [],
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormScreen()));
              },
            )));
  }
}
