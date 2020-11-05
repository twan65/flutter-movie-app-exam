import "package:flutter/material.dart";
import 'dart:convert';

import 'package:padak_starter/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

// State作成
class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  final adminId = 'test';
  final adminPw = 'test';

  String _email;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  void validateAndSubmit() {
    if (validateAndSave()) {
      if (_email == adminId && _password == adminId) {

        // TODO: セッション保存

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MainPage(),
          ),
        );
      } else {
        // TODO: ログイン失敗時の処理
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ログイン'),
      ),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
            key: formKey,
            child: new Column(
              //追加
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Email'),
                  validator: (value) =>
                      value.isEmpty ? 'Email can\'t be empty' : null,
                  onSaved: (value) => _email = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) =>
                      value.isEmpty ? 'Password can\'t be empty' : null,
                  onSaved: (value) => _password = value,
                ),
                //追加
                new RaisedButton(
                  child:
                      new Text('Login', style: new TextStyle(fontSize: 20.0)),
                  onPressed: validateAndSubmit,
                ),
              ],
            )));
  }
}
