import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("ToDo title"),
          Icon(
            Icons.done,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
