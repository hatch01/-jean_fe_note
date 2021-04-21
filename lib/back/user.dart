import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

// SharedPreferences data;
//
// void initData() async {
//   if (data == null) {
//     data = await SharedPreferences.getInstance();
//   }
//   if (kDebugMode) {
//     data.remove(userListID);
//   }
//   data.remove(userListID);
// }
//
// Future<List<String>> userList() async {
//   await initData();
//   return data.getStringList(userListID);
// }
//
// Future<bool> isUser() async {
//   bool retour;
//   await initData();
//   retour = data.containsKey("userList");
//   // print(data);
//   // print(retour);
//   return retour;
// }
//
// void creatingUser(String name) {
//   List<String> nameList;
//   if (data.containsKey(userListID)) {
//     nameList = data.getStringList(userListID);
//   } else {
//     nameList = [];
//   }
//   nameList.add(name);
//   data.setStringList(userListID, nameList);
// }

class StorageService {
  static StorageService _service;
  static SharedPreferences _pref;

  static Future<StorageService> createInstance() async {
    print("create instance");

    if (_service == null) {
      print("creating");

      var _tempClass = StorageService(); //Creates a local instance of service
      /* Creates an instance of Shared Preferences*/

      await _tempClass._getInstance();
      if (kDebugMode) {
        print("in debug mode");
        _pref.remove(userListID);
      }
      _service = _tempClass;
    }
    print("return");
    return _service;
  }

  void _getInstance() async {
    _pref = await SharedPreferences.getInstance();
  }

  bool get isUser {
    print("isUser");
    print(_pref.containsKey(userListID));
    return _pref.containsKey(userListID);
  }

  List<String> get userList {
    print(_pref.getStringList(userListID));
    return _pref.getStringList(userListID);
  }

  void creatingUser(String name) {
    List<String> nameList;
    if (_pref.containsKey(userListID)) {
      nameList = _pref.getStringList(userListID);
    } else {
      nameList = [];
    }
    if(nameList.contains(name)){
      print("there is already a user with this name");
    }else {
      nameList.add(name);
      _pref.setDouble(name, defaultNote);
    }
    _pref.setStringList(userListID, nameList);
  }
  void deletingUser(String name) {
    List<String> nameList;
    if (_pref.containsKey(userListID)) {
      nameList = _pref.getStringList(userListID);
      if (nameList.contains(name)){
        nameList.remove(name);
        _pref.setStringList(userListID, nameList);
      }else{
        print("user not in the list");
      }
    } else {
      print("no name list");
    }
  }

  double getNote(String user) {
    if (_pref.containsKey(user)) {
      return _pref.getDouble(user);
    } else {
      print("user does not exist");
      return 0;
    }
  }
  
  void setNote(String user, double value){
    if (_pref.containsKey(user)) {
      _pref.setDouble(user, value);
    } else {
      print("user does not exist");
    }
  }
  
}
