// TODO Complete the file, main/body.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with 'FutureBuilder' widget.
//      For todo items with the status has been 'done', they should be displayed
//      with the 'line through'. Otherwise, display it with normal text.
//
//   2. Perform the following operations:
//        a. Edit a todo - i.e., when the user tap a todo.
//           This operation will navigate to the '/edit' route.
//        b. Delete a todo - i.e. when the user long-press a todo
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'main_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    final List<Todo> _todos = _state.todos;
    return _state.isbusy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            itemCount: _todos.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.blueGrey,
            ),
            itemBuilder: (context, index) => ListTile(
              title: Text(_todos[index].title,
                  style: TextStyle(
                      decoration: _todos[index].done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
              subtitle: Text(_todos[index].description),
              onTap: () async {
                final todo = await Navigator.pushNamed(context, '/edit',
                    arguments: _todos[index]);
                if (todo != null) _state.updateTodo(todo);
              },
              onLongPress: () => _state.removeTodo(index),
            ),
          );
  }
}
