import 'package:flutter/material.dart';
import 'package:jean_fe_note/back/user.dart';

import 'front/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //needed for android
  await StorageService.createInstance(); //initalise storage instance
  runApp(
    MyApp(), //start the app
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //main widget
    return MaterialApp(
      //normal materrial app
      debugShowCheckedModeBanner: false, //disable debug banner
      home: Init(), //begin with the init screen
    );
  }
}
