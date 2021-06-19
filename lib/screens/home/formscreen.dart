import 'package:flutter/material.dart';
import 'package:my_app/models/location.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:my_app/services/database.dart';

import '../wrapper.dart';

// ignore: must_be_immutable

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _description;
  String _theme;
  String _imageUrl;
  String _locationUrl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form")),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "location name",
                        labelText: 'location name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'location name is Required';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        _name = value;
                      },
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "theme",
                        labelText: 'theme',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'theme is Required';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        _theme = value;
                      },
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "full description",
                        labelText: 'full description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'full description is Required';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        _description = value;
                      },
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "image url",
                        labelText: 'image url',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'image url is Required';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        _imageUrl = value;
                      },
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "location url",
                        labelText: 'location url',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'location url is Required';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        _locationUrl = value;
                      },
                    )),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    Location m = Location(
                        id: 222,
                        name: _name,
                        description: _description,
                        theme: _theme,
                        imageUrl: _imageUrl,
                        locationUrl: _locationUrl);

                    DataBaseService().updateUserData(m);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Wrapper()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
