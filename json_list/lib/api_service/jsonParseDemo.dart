import 'package:flutter/material.dart';
import 'userServices.dart';
import 'package:json_list/models/users.dart';

class JsonParseDemo extends StatefulWidget {
  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  List<User> _users;
  bool _isloading = true;

  @override
  void initState(){
    super.initState();
    _isloading = true;
    userServices.getUsers().then((users) {
      setState(() {
        _users = users;
        _isloading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isloading ? 'Loading ...' : "Users"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: _users.length,
            itemBuilder: (context, index){
              User user = _users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            }
        )
      ),
    );
  }
}
