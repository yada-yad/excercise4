// TODO Complete the file, edit/body.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with conditional UI technique (based on
//      whether it is for 'editing an existing todo' or 'creating a new todo').
//      This includes:
//        a. The 'done' field will only be enabled if it is an 'editing' mode
//
//   2. Update the states and reflect the changes on the UI:
//        a. when the user types in the 'title'.
//        b. when the user types in the 'description'.
//        c. when the user taps on the 'done' checkbox.
//
//   3. Perform the following operations:
//        a. Accept the updated / created item - i.e. when the 'Ok' button is tapped on.
//        b. Cancel the changes - i.e. when the 'Cancel' button is tapped on.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:exercise3/models/todo.dart';
import 'package:flutter/material.dart';

import 'edit_screen.dart';

class Body extends StatefulWidget {
  const Body({state}) : _state = state;

  final EditScreenState _state;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _title = '';
  String _desc = '';
  bool _done;
  void initState() {
    if (widget._state.isEditing == true) {
      _title = widget._state.title;
      _desc = widget._state.description;
      _done = widget._state.done;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildTextLisTile(
            label: 'Title',
            value: widget._state.widget.isEditing ? widget._state.title : '',
            onChanged: (value) {
              widget._state.title = value;
            }),
        _buildTextLisTile(
            label: 'Description',
            value:
                widget._state.widget.isEditing ? widget._state.description : '',
            onChanged: (value) {
              widget._state.description = value;
            }),
        CheckboxListTile(
          value: widget._state.done,
          onChanged: (value) {
            widget._state.done = value;
          },
          title: Text('Done'),
        ),
        _buildButtons(context)
      ],
    );
  }

  ListTile _buildTextLisTile({label, value, onChanged}) {
    return ListTile(
      title: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Ok'),
          onPressed: () {
            widget._state.isEditing == true
                ? _onTodoOkPressedEdit(context)
                : _onTodoOkPressedAdd(context);
          },
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            _onTodoCancelPressed(context);
          },
        ),
      ],
    );
  }

  void _onTodoOkPressedAdd(BuildContext context) async {
    if (!(_desc == '' || _title == '')) {
      Todo _todo = Todo(description: _desc, title: _title);
      Navigator.pop(context, _todo);
    }
  }

  void _onTodoOkPressedEdit(BuildContext context) async {
    if (!(_desc == '' || _title == '')) {
      Todo _todo = Todo(description: _desc, title: _title, done: _done);
      Navigator.pop(context, _todo);
    }
  }

  void _onTodoCancelPressed(BuildContext context) {
    Navigator.pop(context, null);
  }
}
