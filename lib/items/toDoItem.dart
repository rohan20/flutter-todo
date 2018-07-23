import 'package:flutter/material.dart';
import 'package:to_do_app/model/toDo.dart';

class ToDoItem extends StatelessWidget {
  ToDo _toDo;

  ValueChanged<ToDo> onTodoTapped;

  ToDoItem(this._toDo, {@required this.onTodoTapped});

  void _todoTapped() {
    onTodoTapped(_toDo);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _todoTapped();
      },
      child: Container(
        color: _toDo.isChecked ? Colors.green[100] : null,
        child: Padding(
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
                color: Colors.white,
                size: 40.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
