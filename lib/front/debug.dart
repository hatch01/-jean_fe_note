// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:reborn_next_job02/ui/LoginScreen.dart';
// import 'package:reborn_next_job02/ui/splashScreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Splash extends StatefulWidget {
//   @override
//   SplashState createState() => new SplashState();
// }
//
// class SplashState extends State<Splash> {
//   Future checkFirstSeen() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool _seen = (prefs.getBool('seen') ?? false);
//     if (_seen) {
//       Navigator.of(context).pushReplacement(
//           new MaterialPageRoute(builder: (context) => new LoginScreen()));
//     } else {
//       prefs.setBool('seen', true);
//       Navigator.of(context).pushReplacement(
//           new MaterialPageRoute(builder: (context) => new urlScreen()));
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     new Timer(new Duration(seconds: 10), () {
//       checkFirstSeen();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Text('Loading...'),
//       ),
//     );
//   }
// }
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Hello'),
//       ),
//       body: new Center(
//         child: new Text('This is the second page'),
//       ),
//     );
//   }
// }
//
// class IntroScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             new Text('This is the intro page'),
//             new MaterialButton(
//               child: new Text('Gogo Home Page'),
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                     new MaterialPageRoute(builder: (context) => new Home()));
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }