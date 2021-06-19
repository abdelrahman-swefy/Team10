import 'package:flutter/material.dart';
import 'package:my_app/models/location.dart';
import 'package:provider/provider.dart';

import 'location_tile.dart';

class LocationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Provider.of<List<Location>>(context) ?? [];
    return ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, i) {
          Location x = locations[i];
          return LocationTile(location: x);
        });
  }
}
