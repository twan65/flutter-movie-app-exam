import "package:flutter/material.dart";
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpPageState();
  }
}

enum Answers{
  OK,
}

// State作成
class _SignUpPageState extends State<SignUpPage> {

  String _email;
  String _password;

  String _value = '';
  void _setValue(String value) => setState(() => _value = value);


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
                  onPressed: _onPressedSignUp,
                ),
              ],
            )));
  }

  // TODO
  void _onPressedSignUp() {
    print('sign up');
    _showDialog();

  }

  // TODO
  Future _showDialog() async {
    var value = await showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: new Text('案内'),
        content: new Text('会員登録が正常に完了しました。'),
        actions: <Widget>[
          new SimpleDialogOption(child: new Text('OK'),onPressed: (){Navigator.pop(context, Answers.OK);},),
        ],
      ),
    );

    switch(value) {
      case Answers.OK:
        _setValue('OK');
        break;
    }
  }

}
