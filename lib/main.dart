import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/add_new_reminder/add_new_reminder.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/Screens/home/home.dart';
import 'package:flutter_auth/Screens/add_new_reminder/add_new_reminder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminder',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Home(),
      routes: {
        "/add_new_reminder": (context) => AddNewReminder(),
      },
    );
  }
}
