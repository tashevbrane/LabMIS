import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanoid/nanoid.dart';

import '../model/ispit.dart';

import 'package:intl/intl.dart';

class NovIspit extends StatefulWidget {
  final Function addItem;

  NovIspit(this.addItem);

  @override
  State<StatefulWidget> createState() => _NovIspitState();
}

class _NovIspitState extends State<NovIspit> {
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

    final newItem = Ispit(
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
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2025),
              );
              if (picked != null) {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  final pickedDateTime = DateTime(
                    picked.year,
                    picked.month,
                    picked.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );
                  _vremeController.text =
                      DateFormat('yyyy-MM-dd HH:mm').format(pickedDateTime);
                }
              }
            },
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
