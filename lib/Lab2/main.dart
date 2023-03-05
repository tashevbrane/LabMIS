// import 'package:flutter/material.dart';
// import './clothes.dart';
// import './clothes_answer.dart';

// void main() => runApp(Labs());

// class Labs extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _LabsState();
//   }
// }

// class _LabsState extends State<Labs> {
//   void _tapped() {
//     setState(() {
//       _questionIndex += 1;
//     });
//   }

//   var _questionIndex = 0;

//   var question = [
//     {
//       'question': "Пол",
//       'answer': ['машки', 'женски'],
//     },
//     {
//       'question': "Тип",
//       'answer': ['облека', 'артикал', 'патики'],
//     },
//     {
//       'question': "Бренд",
//       'answer': ['zara', 'nike', 'adidas', 'tommy hilfiger'],
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "Облека",
//         home: Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'Облека',
//                 style: TextStyle(
//                   fontSize: 30,
//                   color: Colors.red,
//                 ),
//               ),
//               backgroundColor: Colors.green,
//             ),
//             body: Column(
//               children: [
//                 ClothesQuestion(
//                     question[_questionIndex]['question'].toString()),
//                 ...(question[_questionIndex]['answer'] as List<String>)
//                     .map((answer) {
//                   return ClothesAnswer(_tapped, answer);
//                 }),
//               ],
//             )));
//   }
// }
