import 'package:flutter/material.dart';
import 'package:umsg/Constants/constant.dart';
import 'package:umsg/NewGroupDetails.dart';
import 'package:umsg/add_contact.dart';
import 'package:umsg/group_chat.dart';
import 'package:umsg/main_menu.dart';
import 'package:umsg/new_group.dart';
import 'package:umsg/new_message.dart';
import 'package:umsg/private_chat.dart';
import 'package:umsg/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Comic',
      ),
      home: MainMenuPage(),
    );
  }
}
