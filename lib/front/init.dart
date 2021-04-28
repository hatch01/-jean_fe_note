import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jean_fe_note/front/newUser.dart';

import '../back/user.dart';
import 'note_edition.dart';

double sliderValue = 0;
double screenHeight = 0;
double appbarHeight = 0;
double screenWidth = 0.0;

class Init extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (StorageService().isUser) {
      //if there is users
      List<String> userList = StorageService().userList; //store user list
      String name = userList[0]; //take the first user
      return NoteEditingScreen(name); //start with editing the first user
    } else {
      //else it's the first start
      print("new"); //debug
      return NewUser(); //return the widget to create a new user
    }
  }
}
