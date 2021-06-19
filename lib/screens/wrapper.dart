import 'package:flutter/material.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/services/database.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      for (int i = 0; i < 5; i++) {
        DataBaseService().setUserData(LocationsAll().listobj[i]);
      }
      return Home();
    }
  }
}
