import 'package:flutter/material.dart';

class ClothesQuestion extends StatelessWidget {
  late String _questionContent;

  ClothesQuestion(this._questionContent);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(16), //Направете копчињата да бидат разделени.
      child: Text(
        _questionContent,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.blue, //текстот на прашањето да биде син
        ),
      ),
    );
  }
}
