import 'package:flutter/material.dart';
import 'file:///C:/Users/Do/AndroidStudioProjects/flutter_test/todoapp_project_firestore/lib/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FireStore CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
