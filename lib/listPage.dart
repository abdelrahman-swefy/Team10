import 'package:flutter/material.dart';
import 'package:my_app/formscreen.dart';
import 'package:my_app/data.dart';
import 'details.dart';
import 'main.dart';

class ListPage extends StatelessWidget {
  LocationsAll locations;
  ListPage(LocationsAll locations) {
    this.locations = locations;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favLocations'),
        leading: BackButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
      body: _buildListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FormScreen(
                        locations: locations,
                      )));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: locations.listobj.length,
      itemBuilder: (_, index) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Details(location: locations.listobj[index])));
              },
              child: Image.network(locations.listobj[index].imageUrl),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Details(location: locations.listobj[index])));
                },
                child: ListTile(
                    title: Text(
                      locations.listobj[index].name,
                      textAlign: TextAlign.center,
                      style: (TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    subtitle: Text(
                      locations.listobj[index].theme,
                      textAlign: TextAlign.center,
                    ))),
          ]),
        );
      },
    );
  }
}
