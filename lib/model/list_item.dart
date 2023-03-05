import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem {
  final String id;
  final String predmet;
  final DateTime datumVreme;

  ListItem({
    required this.id,
    required this.predmet,
    required this.datumVreme,
  });
}
