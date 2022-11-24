import 'dart:async';

import 'package:get_storage/get_storage.dart';
class SharedPrefrences{
  static const String token="LoginToken";
  static const String id="Id";
  static const String name="Name";
  static const String email="Email";
  static const String phone_number="Phone";
  static const String avatar="Avatar";
  final box =  GetStorage();

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