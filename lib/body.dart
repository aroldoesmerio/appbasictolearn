import 'dart:convert';

import 'package:appbasictolearn/users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mybody extends StatefulWidget {
  @override
  _MybodyState createState() => _MybodyState();
}

class _MybodyState extends State<Mybody> {
  List<User> _user;

  Future<List<User>> _getUser() async {
    try {
      List<User> listUser = List();
      final response =
          await http.get('https://jsonplaceholder.typicode.com/users');
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson.forEach((item) => listUser.add(User.fromJson(item)));
        return listUser;
      } else {
        debugPrint("Erro ao carregar a lista");
        return null;
      }
    } catch (e) {
      debugPrint("Erro ao carregar a lista");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _getUser().then((map) {
      _user = map;
      print(_user.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _user.length,
      itemBuilder: (context, index){
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(_user[index].name),
              subtitle: Text(_user[index].company.name),
              leading: Icon(Icons.android),
              trailing: Icon(Icons.adb),
              onLongPress: (){
                print([index]);
              },
            )
          ],
        );


      },
    );
  }
}
