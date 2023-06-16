import 'package:flutter/material.dart';
import 'package:laboratoriski/main.dart';
import 'package:laboratoriski/model/user.dart';

class LoginForm extends StatefulWidget {
  final Function(User) onLogin;

  LoginForm({required this.onLogin});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitForm() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      final user = User(
        username: username,
        password: password,
        firstName: "",
        lastName: "",
      );
      widget.onLogin(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: "Корисничко име"),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: "Лозинка"),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text("Најави се"),
          ),
        ],
      ),
    );
  }
}
