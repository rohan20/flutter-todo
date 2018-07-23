import 'package:flutter/material.dart';
import 'package:to_do_app/items/toDoItem.dart';
import 'package:to_do_app/model/toDo.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
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
        itemCount: _dummyToDoList().length,
        itemBuilder: (context, index) {
          return _buildToDoListItem(index);
        },
      ),
    );
  }

  List<ToDo> _dummyToDoList() {
    return <ToDo>[
      ToDo(
        "Buy eggs & milk",
      ),
      ToDo(
        "Iron shirts",
        true,
      ),
      ToDo(
        "Buy eggs & milk",
      ),
      ToDo(
        "Iron shirts",
        true,
      ),
      ToDo(
        "Buy eggs & milk",
      ),
      ToDo(
        "Iron shirts",
        true,
      ),
      ToDo(
        "Buy eggs & milk",
      ),
      ToDo(
        "Iron shirts",
        true,
      ),
    ];
  }

  _buildToDoListItem(int index) {
    return ToDoItem(_dummyToDoList()[index]);
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
