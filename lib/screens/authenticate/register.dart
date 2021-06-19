import 'package:flutter/material.dart';
import 'package:my_app/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String _username;
  String _password;
  String error = '';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('my app'),
          actions: [
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text("Log in"))
          ],
        ),
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "username",
                              labelText: "username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "username is Required";
                              }
                              return null;
                            },
                            onChanged: (String value) {
                              _username = value;
                            },
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "password",
                              labelText: 'password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'password is Required';
                              }
                              if (value.length < 6)
                                return "enter a password at least 6 characters";
                              return null;
                            },
                            onChanged: (String value) {
                              _password = value;
                            },
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "confirm password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "confirm password";
                              }
                              if (value != _password)
                                return "password missmatch";
                              return null;
                            },
                            onSaved: (String value) {
                              _password = value;
                            },
                          )),
                      RaisedButton(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result =
                                await _auth.regiter(_username, _password);

                            if (result == null) {
                              setState(() {
                                error =
                                    'Invalid username or username might be taken';
                              });
                            } else {
                              print('successfully');
                            }
                            return;
                          }
                          _formKey.currentState.save();
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                ))));
  }
}
