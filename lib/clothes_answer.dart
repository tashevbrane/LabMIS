import 'package:flutter/material.dart';

class ClothesAnswer extends StatelessWidget {
  late String answerText;
  void Function() tappedAnswer;

  ClothesAnswer(this.tappedAnswer, this.answerText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green, //Копчињата да бидат со зелена позадина
        ),
        onPressed: tappedAnswer,
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 20,
            color: Colors.red, //текстот да биде црвен
          ),
        ));
  }
}
