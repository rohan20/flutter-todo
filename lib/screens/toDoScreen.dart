import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app/items/toDoItem.dart';
import 'package:to_do_app/model/toDo.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  TextEditingController titleTextController = TextEditingController();

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
    return ToDoItem(
      allToDoList[index],
      onTodoTapped: (ToDo todo) {
        _handleTodoTap(todo);
      },
    );
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
    _showDialogToEnterTodo();
  }

  Future<Null> _showDialogToEnterTodo() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(12.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  enabled: true,
                  controller: titleTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Todo Title",
                    hintText: "Eg: Buy eggs",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _alertDialogButton("Cancel", Colors.red),
                      SizedBox(width: 12.0),
                      _alertDialogButton("Add", Colors.green, true),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  _alertDialogButton(
    String buttonText,
    Color textColor, [
    bool isAddTodoButton = false,
  ]) {
    return Expanded(
      child: RaisedButton(
          color: Colors.white,
          child: Text(buttonText),
          textColor: textColor,
          onPressed: () {
            if (titleTextController.text.isNotEmpty) {
              if (isAddTodoButton) {
                setState(() {
                  allToDoList.insert(
                      0, new ToDo(titleTextController.text, false));
                });
              }
            }

            titleTextController.clear();
            Navigator.of(context).pop();
          }),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    titleTextController.dispose();
    super.dispose();
  }

  void _handleTodoTap(ToDo todo) {
    setState(() {
      allToDoList.remove(todo);

      if (todo.isChecked) {
        //if todo was checked, uncheck it and move it to the top
        todo.isChecked = false;
        allToDoList.insert(0, todo);
      } else {
        //if todo was unchecked, check it and move it to the bottom
        todo.isChecked = true;
        allToDoList.insert(allToDoList.length, todo);
      }
    });
  }
}
