// TODO Complete the model class Todo.
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
// Define the following methods:
//   a. all the getters and setters
//   b. the 'copy' constructor
//   c. the 'fromJson' constructor
//   d. the 'toJson' method
//-----------------------------------------------------------------------------------------------------------------------------

class Todo {
  String _title;
  String _description;
  bool _done;
  int _id;
  int _user;
  String get title => this._title;
  set title(String value) => this._title = value;
  String get description => this._description;
  set(String value) => this._description = value;
  bool get done => this._done;
  set done(bool value) => this._done = value;
  int get id => this._id;
  set id(int value) => this._id = value;
  int get user => this._user;
  set user(int value) => this._user = value;
  Todo(
      {String title = '',
      String description = '',
      bool done = false,
      int id,
      int user})
      : _title = title,
        _description = description,
        _done = done,
        _id = id,
        _user = user;

  Todo.copy(Todo todo)
      : this(
            title: todo._title,
            description: todo._description,
            done: todo._done,
            id: todo._id,
            user: todo._user);

  Todo.fromjson(Map<String, dynamic> map)
      : this(
            title: map['title'],
            description: map['description'],
            done: map['done'],
            id: map['id'],
            user: map['user']);

  Map<String, dynamic> toJson() => {
        'title': _title,
        'description': _description,
        'done': _done,
        'id': _id,
        'user': _user
      };
}
