import 'package:flutter/material.dart';
import 'package:sqldataexample/Login_Page.dart';
import 'package:sqldataexample/update_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white
      ),
      home: LoginPage(),
      routes: {
        "UpdateScreen":(BuildContext context) =>UpdateScreen(),
      },
    );
  }
}


