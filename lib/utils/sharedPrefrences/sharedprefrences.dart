import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SharedPrefrences{
  static const String token="LoginToken";
  static const String id="Id";
  static const String name="Name";
  static const String email="Email";
  static const String phone_number="Phone";
  static const String avatar="Avatar";
  static const String dark_theme="Theme";
  final box =  GetStorage();


     bool get_theme(){
        return box.read(dark_theme)??false;
     }
  void saveTheme(bool isDark){
    box.write(dark_theme,isDark)   ;
  }

  void saveToken(String val)async{
    box.write(token,val);
  }
  void saveId(String val)async{
    box.write(id,val);
  }

  void saveName(String val)async{
    box.write(name,val);
  }

  void saveEmail(String val)async{
    box.write(token,val);
  }

  void savePhone(String val)async{
    box.write(token,val);
  }

  void saveAvatar(String val)async{
    box.write(token,val);
  }
}