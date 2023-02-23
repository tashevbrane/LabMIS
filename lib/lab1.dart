import 'package:flutter/material.dart';

void main() => runApp(Labs());

class Labs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "183292",
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 4, 84, 48),
            appBar: AppBar(
              title: Text(
                '183292',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Color.fromARGB(255, 6, 146, 125),
            ),
            body: Column(
              children: [
                Text(
                  'Lab 1 - Бранко Ташев',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )
              ],
            )));
  }
}
