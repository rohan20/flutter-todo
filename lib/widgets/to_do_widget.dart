import 'package:flutter/material.dart';
import 'package:to_do_app/model/to_do.dart';

class ToDoItem extends StatelessWidget {
  final ToDo _toDo;
  final bool _isChecked;
  ValueChanged<ToDo> onTodoTapped;
  ValueChanged<ToDo> onTodoDismissed;

  ToDoItem(
    this._toDo,
    this._isChecked, {
    @required this.onTodoTapped,
    @required this.onTodoDismissed,
  });

  void _todoTapped() {
    onTodoTapped(_toDo);
  }

  void _todoDismissed() {
    onTodoDismissed(_toDo);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(_toDo.id.toString()),
      background: Container(
        color: Colors.red[300],
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => _todoDismissed(),
      child: InkWell(
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
      ),
    );
  }
}
