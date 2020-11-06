import "package:flutter/material.dart";
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpPageState();
  }
}

// State作成
class _SignUpPageState extends State<SignUpPage> {

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign Up'),
      ),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
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
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Name'),
                  obscureText: true,
                  validator: (value) =>
                  value.isEmpty ? 'Name can\'t be empty' : null,
                  onSaved: (value) => _password = value,
                ),
                //追加
                new RaisedButton(
                  child:
                  new Text('OK', style: new TextStyle(fontSize: 20.0, color: Colors.blue)),
                  onPressed: () => {

                  },
                ),
              ],
            )));
  }
}
