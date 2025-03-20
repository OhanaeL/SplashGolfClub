import 'package:flutter/material.dart';

class TableCellWidget extends StatelessWidget {
  final String text;
  final bool bold;

  const TableCellWidget({required this.text, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        textAlign: TextAlign.center,
      ),
    );
  }
}
