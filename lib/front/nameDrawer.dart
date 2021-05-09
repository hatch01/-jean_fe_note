import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jean_fe_note/back/user.dart';

import 'frontSharedValue.dart';
import 'newUser.dart';
import 'note_editing/noteEditingScreen.dart';

class NameDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //main widget in the drawer
    return Column(children: [
      name(context), //the list of name
      newUserButton(context), //the button to create new user
    ]);
  }

  Widget name(BuildContext context) {
    List<Widget> namelistWidget = []; //the widget list to display the name
    final List<String> nameList = StorageService().userList; //get the user list
    print("nameList : $nameList"); //debug

    /*-----build the list of user-----*/
    for (var currentUser in nameList) {
      //loop for each user
      namelistWidget.add(MaterialButton(
        //add a new widget which is a button
        onPressed: () {
          //when it's pressed
          print("pressed : $currentUser"); //debug
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NoteEditingScreen(currentUser)),
          ); //go to the user editing page
        },
        onLongPress: () {
          //on long press
          print("long pressed"); //debug
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return deleteUser(context, currentUser);
            },
          ); //show a pop-up to ask if we are sure that we want to delete the user
        },
        child: Row(
          //the button is a row
          crossAxisAlignment: CrossAxisAlignment.center, //center vertically
          mainAxisAlignment: MainAxisAlignment.start, //go to left horizontally
          children: [
            Icon(Icons.person), //display an icon
            SizedBox(
              width: screenWidth / 20,
            ), //a list space
            Text(currentUser), //the name of the user
          ],
        ),
      ));
    }
    /*-----return the widget built-----*/
    return Expanded(
      //user the maximum size because it's the child and listview don't know what size to take
      child: ListView(
        //use listview to scroll if there is a lot of user
        children: namelistWidget, //children are the user widget build bellow
      ),
    );
  }

  /*-----the new user button at the bottom of the drawer-----*/
  Widget newUserButton(BuildContext context) {
    return Align(
      //first stick it at the bottom center of the drawer
      alignment: FractionalOffset.bottomCenter,
      child: SizedBox(
        //user sized box to take the whole width available
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all(Colors.black.withOpacity(0.1))),
          //set the hover to black
          child: Row(children: [
            //user row to display multiple things
            Icon(
              Icons.add,
              color: Colors.black, //icon color is black
            ), //add a "+" icon
            Text(
              "Ajouter un nouvelle utilisateur",
              style:
                  TextStyle(color: Colors.black), //set the text color to black
            ), //show the test
          ]),
          onPressed: () {
            //when button pressed
            showDialog(
              //display pop-up
              context: context,
              builder: (BuildContext context) => NewUser(), //create new user
            );
          },
        ),
      ),
    );
  }

  /*-----widget to delete user-----*/

  Widget deleteUser(BuildContext context, final String userName) {
    //the pop-up to delete a user
    return AlertDialog(
      //a pup-up
      title: Text("voulez vous vraiment supprimer $userName"), //show a message
      content: Row(
        //use row for 2 button
        mainAxisAlignment: MainAxisAlignment.center, //center horizontally
        children: [
          MaterialButton(
            //first button for don't delete
            onPressed: () {
              Navigator.pop(context);
            }, //when the non is pressed just delete the pop-up
            child: Text("non"), //the text of the widget
            color: Colors.green, //the widget color
          ),
          MaterialButton(
            //second button to delete
            onPressed: () {
              //when presses
              List<String> userList =
                  StorageService().userList; //Store the list of user
              int userIndex = userList.indexOf(
                  userName); //store the index in the list of the user to delete
              if (userIndex > 0) {
                //if it's a normal user (not the first)
                userIndex--; //the next displayed user will be the previous
              } else {
                //if it was the first user
                userIndex = 0; //keep the user index 0
              }
              StorageService()
                  .deletingUser(userName); //delete the user in the database
              userList = StorageService().userList; //store the new list
              print("userList : $userList"); //debug
              if (userList.isNotEmpty) {
                //if there is still user
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NoteEditingScreen(userList[userIndex])),
                ); //just show the screen to edit the note of the user selected bellow
              } else {
                //if there is no user
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewUser()),
                );
                //display pop-up to create new user
              }
            },
            child: Text("oui"), //the content of the button
            color: Colors.red, //the color of the button
          ),
        ],
      ),
    );
  }
}
