import 'package:flutter/material.dart';
import 'package:my_app/models/location.dart';

import 'details.dart';

// ignore: must_be_immutable
class LocationTile extends StatelessWidget {
  Location location;
  LocationTile({this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(location: location)));
          },
          child: Column(
            children: [
              Container(
                child: Image.network(location.imageUrl),
              ),
              ListTile(
                  title: Text(
                    location.name,
                    textAlign: TextAlign.center,
                    style:
                        (TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  subtitle: Text(
                    location.theme,
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ));
  }
}
