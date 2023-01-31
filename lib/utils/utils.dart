
import 'package:flutter/material.dart';

class Utils {

 final String user_name="user_name";
 final String token="token";

 void showMsg(context,String msg) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
     content: Text(msg),
   ));
 }
}

