// TODO Complete the service class, UserService
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   Define the following method to handle REST call about the User data
//    to the REST service.
//       a. getUserByLoginAndPassword: to get a user data, given his/her login and password.
//          If no match, this method returns null.
//          This method will be used for constructing the logic of the authentication process in the LoginScreen
//-----------------------------------------------------------------------------------------------------------------------------

import 'rest.dart';
import '../models/user.dart';

class UserService {
  static Future<User> getUserByLoginAndPassword(
      {String login, String password}) async {
    final List jsonList =
        await Rest.get("user?login=$login&password=$password");

    return jsonList.length == 0 ? null : User.fromjson(jsonList[0]);
  }
}
