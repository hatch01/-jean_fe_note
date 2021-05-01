import 'package:flutter/material.dart';
import 'package:jean_fe_note/back/user.dart';

import 'note_editing/noteEditingScreen.dart';

// ignore: must_be_immutable
class NewUser extends StatelessWidget {
  String name; //the name of the user
  GlobalKey<FormState> myKey; //a control key to access to the textfield

  @override
  Widget build(BuildContext context) {
    myKey = GlobalKey<FormState>(); // create new key
    return new AlertDialog(
      //whos a pop-up
      title: const Text('Nouveau utilisateur'), //the title of the pop-up
      content: Form(
          //place a form in the content of the pop-up
          key: myKey, //user the key created bellow
          child: TextFormField(
            //user a text field in the form
            onEditingComplete: () {
              //when we press enter it create the new user
              submit(context);
            },
            onChanged: (value) {
              //when the value change, put the new value in tha name variable
              name = value;
            },
            validator: (value) {
              //define a validator
              if (value == null || value.isEmpty) {
                //if the value is empty
                return 'veuillez entrer un nom'; //display  message
              }
              if (StorageService().userExist(value)) {
                return "l'utilisateur existe deja";
              }
              return null; //else do nothing
            },
          )),
      actions: [
        TextButton(
          //define the button of the form
          onPressed: () {
            //whenn pressed create the user
            submit(context);
          },
          child: Text("création"), //the text in the button
        )
      ],
    );
  }

  void submit(BuildContext context) {
    //create the user
    if (myKey.currentState.validate()) {
      //if the entry is correct
      print(name); //debug
      StorageService().creatingUser(name); //create the user in the database
      myKey = null; //reset the key
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoteEditingScreen(name)),
      ); //go to the editing screen for the user created
    }
  }
}
