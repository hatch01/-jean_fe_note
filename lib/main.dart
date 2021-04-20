import 'package:flutter/material.dart';
import 'package:jean_fe_note/back/user.dart';

import 'front/home.dart';

Future<void> main() async {
  // SharedPrefs().init();
  // sharedPrefs.init();
  // initData();
  await StorageService.createInstance();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Init(),
    );
  }
}
