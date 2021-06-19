import 'package:flutter/material.dart';
import 'package:my_app/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  Location location;
  Details({this.location});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text(location.name,
                    style: GoogleFonts.caveat(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic)),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Image.network(location.imageUrl),
              ),
              Container(
                padding: EdgeInsets.all(0),
                child: Text(location.description,
                    style: GoogleFonts.caveat(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        fontStyle: FontStyle.italic)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL(location.locationUrl);
        },
        child: const Icon(Icons.map),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
