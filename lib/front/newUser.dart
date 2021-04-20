import 'package:flutter/material.dart';
import 'package:jean_fe_note/back/user.dart';
import 'package:jean_fe_note/front/home.dart';

String name;
var myKey = GlobalKey<FormState>();

Widget newUser(BuildContext context,{ bool first = false}) {
  return new AlertDialog(
    title: const Text('Nouveau utilisateur'),
    content: Form(
        key: myKey,
        child: TextFormField(
          onEditingComplete: () {
            submit(context, first: first);
          },
          onChanged: (value) {
            name = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'veuillez entrer un nom';
            }
            return null;
          },
        )),
    actions: [
      TextButton(
          onPressed: () {
            submit(context, first: first);
          },
          child: Text("création"))
    ],
  );
}

void submit(BuildContext context,{ bool first = false}) {
  if (myKey.currentState.validate()) {
    print(name);
    StorageService().creatingUser(name);
    if(!first) {
      Navigator.of(context).pop();
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }
}
