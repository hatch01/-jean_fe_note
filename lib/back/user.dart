import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

//the service to store all the data in a permanent database
class StorageService {
  static StorageService _service; //the service
  static SharedPreferences _pref; //the object to manipulate database

  static Future<StorageService> createInstance() async {
    //creating instance
    print("create instance"); //debug

    if (_service == null) {
      //if there is no servuce
      print("creating"); //debug

      var _tempClass = StorageService(); //Creates a local instance of service
      /* Creates an instance of Shared Preferences*/
      await _tempClass._getInstance();
      if (kDebugMode) {
        //if in debug
        print("in debug mode"); //debug
        // _pref.remove(userListID); //clean the database
      }
      _service = _tempClass; //store the brand  new service
    }
    print("return"); //debug
    return _service; //return the service
  }

  void _getInstance() async {
    //fonc to create an instance of the sharedpref lib
    _pref = await SharedPreferences.getInstance(); //create the instance
  }

  bool get isUser {
    //getter to know if there is users
    print("isUser"); //debug
    print(_pref.containsKey(userListID)); //debug
    return _pref.containsKey(userListID); //return if there is users
  }

  List<String> get userList {
    //getter to get the userlist
    print(_pref.getStringList(userListID)); //debug
    return _pref.getStringList(userListID); //return the list
  }

  void creatingUser(String name) {
    //fonc to create a new user
    List<String> nameList; //list to store the user list
    if (_pref.containsKey(userListID)) {
      //if there is a list of user
      nameList =
          _pref.getStringList(userListID); //store the user list in the var
    } else {
      //if there is no userlist
      nameList = []; //store a blank list
    }
    if (nameList.contains(name)) {
      //if the user already exist
      print("there is already a user with this name"); //debug
    } else {
      //if the user doesn't exist
      nameList.add(name); //add the user to the list
      _pref.setDouble(name, defaultNote); //write the note of the new user
    }
    _pref.setStringList(userListID, nameList); //write the new list
  }

  void deletingUser(String name) {
    //fonc to delete a user
    List<String> nameList; //list to store the user list
    if (_pref.containsKey(userListID)) {
      //if there is a list of user
      nameList =
          _pref.getStringList(userListID); //store the user list in the var
      if (nameList.contains(name)) {
        //if the name is in the list(yes it's double check)
        nameList.remove(name); //delete the user from the local list
        _pref.setStringList(userListID, nameList); //write the new list
      } else {
        print("user not in the list"); //debug
      }
    } else {
      print("no name list"); //debug
    }
  }

  double getNote(String user) {
    //func to get the note of a person
    if (userExist(user)) {
      //if the user exist
      return _pref.getDouble(user); //return his note
    } else {
      //if the user doesn't exist
      print("user does not exist"); //debug
      return 0; //return 0
    }
  }

  void setNote(String user, double value) {
    //func to set note
    if (userExist(user)) {
      //if the user exist
      _pref.setDouble(user, value); //set the new note
    } else {
      //if the user doesn't exist
      print("user does not exist"); //debug
    }
  }

  bool userExist(String name){
    if (_pref.containsKey(name)){
      return true;
    }else{
      return false;
    }
  }

}
