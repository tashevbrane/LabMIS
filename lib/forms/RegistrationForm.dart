import 'package:flutter/material.dart';
import 'package:laboratoriski/main.dart';
import 'package:laboratoriski/model/user.dart';

class RegistrationForm extends StatefulWidget {
  final Function(User) onRegister;

  RegistrationForm({required this.onRegister});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  // Додадете ги контролерите за останатите полиња

  void _submitForm() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    // Земете ги вредностите на останатите полиња

    void _submitForm() {
      final username = _usernameController.text;
      final password = _passwordController.text;
      final firstName = _firstNameController.text;
      final lastName = _lastNameController.text;

      if (username.isNotEmpty &&
          password.isNotEmpty &&
          firstName.isNotEmpty &&
          lastName.isNotEmpty) {
        final user = User(
          username: username,
          password: password,
          firstName: firstName,
          lastName: lastName,
        );
        widget.onRegister(user);
      }
    }

    if (username.isNotEmpty &&
        password.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty) {
      final user = User(
        username: username,
        password: password,
        firstName: firstName,
        lastName: lastName,
        // Подесете ги вредностите на останатите атрибути
      );
      widget.onRegister(user);
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
          TextField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: "Име"),
          ),
          TextField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: "Презиме"),
          ),
          // Додадете ги полињата за останатите информации

          ElevatedButton(
            onPressed: _submitForm,
            child: Text("Регистрирај се"),
          ),
        ],
      ),
    );
  }
}
