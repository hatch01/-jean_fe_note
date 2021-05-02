import 'package:flutter/material.dart';
import 'package:jean_fe_note/front/note_editing/noteEditorSharedValue.dart';

import '../nameDrawer.dart';
import 'noteEditor.dart';

class NoteEditingScreen extends StatelessWidget {
  final String username; //the var to keep the user name we are editing

  NoteEditingScreen(this.username); //initializer
  @override
  Widget build(BuildContext context) {
    sharedUserName=username;
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
      body: Row(
        //define the body
        mainAxisAlignment: MainAxisAlignment.center, //center horizontally
        children: [
          NoteEditor(), //draw the note slider
        ],
      ),
    );
  }
}
