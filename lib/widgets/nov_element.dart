import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanoid/nanoid.dart';

import '../model/list_item.dart';

import 'package:intl/intl.dart';

class NovElement extends StatefulWidget {
  final Function addItem;

  NovElement(this.addItem);

  @override
  State<StatefulWidget> createState() => _NovElementState();
}

class _NovElementState extends State<NovElement> {
  final _predmetController = TextEditingController();
  final _vremeController = TextEditingController();

  late String predmet;
  late DateTime vreme;

  void _submitData() {
    if (_vremeController.text.isEmpty) {
      return;
    }
    final vnesenPredmet = _predmetController.text;
    final vnesenoVreme = DateTime.parse(_vremeController.text);
    //String formatedDate = DateFormat('dd-MM-yyyy').format(_vremeController.text);

    if (vnesenPredmet.isEmpty) {
      return;
    }

    final newItem = ListItem(
      id: nanoid(5),
      predmet: vnesenPredmet,
      datumVreme: vnesenoVreme,
    );
    widget.addItem(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _predmetController,
            decoration: InputDecoration(labelText: "Предмет"),
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _vremeController,
            decoration: InputDecoration(labelText: "Датум и време"),
            keyboardType: TextInputType.datetime,
            onSubmitted: (_) => _submitData(),
          ),
          ElevatedButton(
            onPressed: _submitData,
            child: Text("Додади"),
          ),
        ],
      ),
    );
  }
}
