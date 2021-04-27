import 'package:flutter/material.dart';
import 'package:jean_fe_note/front/nameDrawer.dart';
// import 'package:jean_fe_note/front/noteEditor/noteEditor.dart';

class NoteEditingScreen extends StatelessWidget {
  final String username; //the var to keep the user name we are editing

  NoteEditingScreen(this.username); //initializer

  @override
  Widget build(BuildContext context) {
    print(username); //debug

    return Scaffold(
      //scaffold because it's the root of the app
      drawer: Drawer(
        //define the drawer
        child: NameDrawer(), //the widget which is in the drawer
      ),
      appBar: AppBar(
        //define the app bar
        title: Text(username), //just put the name of the person
      ),
      body: Align(
        alignment: Alignment.center,
        child: NoteEditor(username), //draw the note slider
      ),
    );
  }
}
