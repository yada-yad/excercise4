// TODO Complete the service class, TodoService
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   Define the following methods to handle REST calls about the Todo data
//    to the REST service.
//       a. getTodoListByUser: to get all the todos for a user (with given user id).
//       b. addTodo: to add a new todo.
//       c. updateTodo: to edit a todo.
//       d. removeTodo: to delete a todo
//-----------------------------------------------------------------------------------------------------------------------------

import 'rest.dart';
import '../models/todo.dart';

class TodoService {
  static Future<List<Todo>> getTodoListByUser(int userId) async {
    final List jsonlist = await Rest.get('todos?id=$userId');
    return jsonlist.map((json) => Todo.fromjson(json)).toList();
  }

  static Future<Todo> addTodo(Todo todo) async {
    final json = Rest.post('todos', data: todo.toJson());
    return Todo.fromjson(json as Map);
  }

  static Future<Todo> updateTodo(Todo todo) async {
    final json = Rest.put('todos', data: todo.toJson());
    return Todo.fromjson(json as Map);
  }

  static Future<void> removeTodo(Todo todo) async {
    return Rest.delete('todos/${todo.id}');
  }
}
