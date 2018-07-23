import 'package:flutter/material.dart';
import 'package:to_do_app/items/toDoItem.dart';
import 'package:to_do_app/model/toDo.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<ToDo> allToDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: toDoList(),
      floatingActionButton: _fab(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text("Flutter To Do"),
    );
  }

  toDoList() {
    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      child: ListView.builder(
        itemCount: allToDoList.length,
        itemBuilder: (context, index) {
          return _buildToDoListItem(index);
        },
      ),
    );
  }

  _buildToDoListItem(int index) {
    return ToDoItem(allToDoList[index]);
  }

  FloatingActionButton _fab() {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          _fabPressed();
        });
      },
    );
  }

  _fabPressed() {
    print("Added new todo");
    allToDoList.add(new ToDo("New todo", true));
  }
}
