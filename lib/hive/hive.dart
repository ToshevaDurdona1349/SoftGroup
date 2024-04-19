

import 'package:hive_flutter/adapters.dart';

class HiveRepository {
  var hive = Hive.box("profil");



  saveName(String name){
    hive.put('name',name);
  }


  String getName() {
    return hive.get("name", defaultValue:'');
  }

  saveUserName(String userName){
    hive.put('userName',userName);
  }


  String getUserName() {
    return hive.get("userName", defaultValue:'');
  }

  saveEmail(String email){
    hive.put('email',email);
  }


  String getEmail() {
    return hive.get("email", defaultValue:'');
  }

  savePhoneNumber(String phoneNumber){
    hive.put('phoneNumber',phoneNumber);
  }


  String getPhoneNumber() {
    return hive.get("phoneNumber", defaultValue:'');
  }


}