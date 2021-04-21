import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jean_fe_note/back/user.dart';
import 'package:jean_fe_note/front/home.dart';

import 'newUser.dart';

class NameDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Name(),
      NewUserButton(),
    ]);
  }
}

class Name extends StatelessWidget {
  var namelistWidget = List<Widget>();
  List<String> nameList;
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    nameList = StorageService().userList;
    print("nameList : $nameList");
    for (var i in nameList) {
      namelistWidget.add(MaterialButton(
        onPressed: () {
          print("pressed : $i");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home(i)),
          );
        },
        onLongPress: () {
          print("long pressed");
          showDialog(
            context: context,
            builder: (BuildContext context) => deleteUser(i),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.person),
            SizedBox(
              width: screenWidth / 20,
            ),
            Text(i),
          ],
        ),
      ));
    }
    return Expanded(
      child: ListView(
        children: namelistWidget,
      ),
    );
  }
}

class NewUserButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          padding: EdgeInsets.all(0),
          elevation: 0,
          color: Colors.white,
          child: Row(children: [
            Icon(Icons.add),
            Text(
              "Ajouter un nouvelle utilisateur",
              //style: TextStyle(fontSize: 50),
            ),
          ]),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => newUser(context),
            );
          },
        ),
      ),
    );
  }
}

class deleteUser extends StatelessWidget {
  String userName;

  deleteUser(this.userName);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("voulez vous vraiment supprimer cet utilisateur"),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("non"),
            color: Colors.green,
          ),
          MaterialButton(
            onPressed: () {
              List<String> userList = StorageService().userList;
              int userIndex = userList.indexOf(userName);
              userIndex--;
              StorageService().deletingUser(userName);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Home(userList[userIndex])),
              );
            },
            child: Text("oui"),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
