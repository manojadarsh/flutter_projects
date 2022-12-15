import 'package:http/http.dart' as http;
import 'package:json_list/models/users.dart';

class userServices {
  static const String userURL = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(userURL);
      if (response.statusCode == 200) {
        final List<User> users = usersFromJson(response.body);
        return users;
      } else {
        return List<User>();
      }
    } catch (e) {
      return List<User>();
    }
  }
}
