import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/to_do_widget.dart';
import 'package:to_do_app/model/to_do.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  TextEditingController titleTextController = TextEditingController();

  List<ToDo> todosList = [];
  Set<ToDo> checkedTodos = Set<ToDo>();

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
        itemCount: todosList.length,
        itemBuilder: (context, index) {
          return _buildToDoListItem(index);
        },
      ),
    );
  }

  _buildToDoListItem(int index) {
    return ToDoItem(
      todosList[index],
      checkedTodos.contains(todosList[index]),
      onTodoTapped: (ToDo todo) {
        setState(() {
          _handleTodoTap(todo);
        });
      },
      onTodoDismissed: (ToDo todo) {
        setState(() {
          _handleTodoDismissed(todo);
        });
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
                  autofocus: true,
                  maxLines: 1,
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
                  todosList.insert(0, new ToDo(titleTextController.text));
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
    int newPositionOfTodo;
    todosList.remove(todo);

    if (checkedTodos.contains(todo)) {
      //if todo was checked, uncheck it and move it to the top
      newPositionOfTodo = 0;
      checkedTodos.remove(todo);
    } else {
      //if todo was unchecked, check it and move it to the bottom
      newPositionOfTodo = todosList.length;
      checkedTodos.add(todo);
    }

    todosList.insert(newPositionOfTodo, todo);
  }

  void _handleTodoDismissed(ToDo todo) {
    checkedTodos.remove(todo);
    todosList.remove(todo);
  }
}
