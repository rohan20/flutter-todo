import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        color: Colors.white,
      ),
      floatingActionButton: _fab(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text("Flutter To Do"),
    );
  }

  FloatingActionButton _fab() {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        _fabPressed();
      },
    );
  }

  _fabPressed() {
    print("Added new todo");
  }

}
