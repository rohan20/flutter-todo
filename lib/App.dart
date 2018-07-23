import 'package:flutter/material.dart';
import 'package:to_do_app/screens/toDoScreen.dart';

class App {
  App() {
    runApp(new MaterialApp(
      title: "Flutter To Do",
      home: ToDoScreen(),
    ));
  }
}
