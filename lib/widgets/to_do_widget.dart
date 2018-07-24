import 'package:flutter/material.dart';
import 'package:to_do_app/model/to_do.dart';

class ToDoItem extends StatelessWidget {
  final ToDo _toDo;
  final bool _isChecked;

  ValueChanged<ToDo> onTodoTapped;

  ToDoItem(this._toDo, this._isChecked, {@required this.onTodoTapped});

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
        color: _isChecked ? Colors.green[100] : null,
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
                _isChecked ? Icons.done : null,
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
