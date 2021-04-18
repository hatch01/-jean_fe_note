import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> testRead() async {
// obtain shared preferences
  final prefs = await SharedPreferences.getInstance();
  print(prefs.getInt('testValue'));
}

Future<void> testWrite() async {
// obtain shared preferences
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('testValue', 42);
}
