import 'package:flutter/material.dart';
import 'package:my_app/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email;
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
                label: Text("Regsiter"))
          ],
        ),
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "eg: xxx@gmail.com (no space after com)",
                            labelText: "email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'username is Required';
                            }
                            return null;
                          },
                          onChanged: (String value) {
                            _email = value;
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
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result =
                              await _auth.signIn(_email, _password);
                          if (result == null) {
                            setState(() {
                              error = 'Invalid username or password';
                            });
                          } else {
                            print('successfully');
                          }
                        }

                        _formKey.currentState.save();
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ))));
  }
}
