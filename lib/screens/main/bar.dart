// TODO Complete the file, main/bar.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with conditional UI technique (based on
//      whether the user has logged in or not).
//      This includes:
//        a. The app bar shows 'unknown user' logo and the 'Login' button if
//           the user has not logged in yet.
//
//        b. Otherwise (if the user has logged in), the app bar shows the user
//           photo and name, as well as the 'Logout' button.
//
//   2. Perform the following operations:
//        a. Login  - This operation will navigate to the '/login' route.
//        b. Logout - This will reset the 'user' state to 'null'.
//-----------------------------------------------------------------------------------------------------------------------------

import 'dart:developer';

import 'package:exercise3/models/user.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  final MainScreenState _state;
  const Bar({state}) : _state = state;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CircleAvatar(
          backgroundImage: _state.user == null
              ? AssetImage('assets/unknown_user.png')
              : NetworkImage(_state.user)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Todo List'),
          Text(_state.user == null ? 'User name goes here' : _state.user,
              style: TextStyle(fontSize: 12.0)),
        ],
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.login),
            onPressed: () async {
              final user = await Navigator.of(context).pushNamed('/login');
              _state.user = user;
              _state.refreshTodoList();
            }),
        IconButton(
            icon: Icon(
              Icons.login,
              color: Colors.red,
            ),
            onPressed: () async {
              _state.user = null;
            })
      ],
    );
  }
}
