import 'package:flutter/material.dart';
import 'package:to_do_app/screens/to_do_screen.dart';

class App {
  App() {
    runApp(new MaterialApp(
      title: "Flutter To Do",
      home: ToDoScreen(),
    ));
  }
}
