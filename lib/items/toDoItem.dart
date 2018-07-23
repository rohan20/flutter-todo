import 'package:flutter/material.dart';
import 'package:to_do_app/model/toDo.dart';

class ToDoItem extends StatelessWidget {

  ToDo _toDo;

  ToDoItem(this._toDo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            _toDo.title,
            style: Theme.of(context).textTheme.headline,
          ),
          Icon(
            _toDo.isChecked ? Icons.done : null,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
