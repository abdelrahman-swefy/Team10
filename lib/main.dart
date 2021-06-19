import 'package:flutter/material.dart';
import 'package:my_app/screens/wrapper.dart';
import 'package:my_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
//https://media.gettyimages.com/photos/this-picture-taken-on-october-23-2019-shows-a-view-of-the-cairo-tower-picture-id1177753387?s=612x612
//https://www.google.com/maps/d/viewer?msa=0&err=1&mid=1PJoFBd74sDrOP61uiQF7ruc6G3Y&ll=30.0462603091972%2C31.22426704999999&z=18
//The Cairo Tower (Egyptian Arabic: برج القاهرة‎, Borg El-Qāhira) is a free-standing concrete tower in Cairo, Egypt. At 187 m (614 ft), it is the tallest structure in Egypt and North Africa. It was the tallest structure in Africa for ten years until 1971, when it was surpassed by Hillbrow Tower in South Africa.
//One of Cairo's well-known modern monuments, sometimes considered Egypt's second most famous landmark after the Pyramids of Giza, it stands in the Gezira district on Gezira Island in the River Nile, close to downtown Cairo.
