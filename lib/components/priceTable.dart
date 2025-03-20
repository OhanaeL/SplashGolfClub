import 'package:flutter/material.dart';
import 'package:splashgolfclub/components/tableCellWiget.dart';

class PriceTable extends StatelessWidget {
  final String title;
  final List<String> prices;

  const PriceTable({required this.title, required this.prices});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 600, // Set the width to 600px
            child: Table(
              border: TableBorder.all(color: Colors.grey.shade300),
              columnWidths: {0: FractionColumnWidth(.3)},
              children: [
                TableRow(
                  children: [
                    TableCellWidget(text: ""),
                    TableCellWidget(text: "Mon", bold: true),
                    TableCellWidget(text: "Tue", bold: true),
                    TableCellWidget(text: "Wed", bold: true),
                    TableCellWidget(text: "Thu", bold: true),
                    TableCellWidget(text: "Fri", bold: true),
                    TableCellWidget(text: "Sat", bold: true),
                    TableCellWidget(text: "Sun", bold: true),
                  ],
                ),
                TableRow(
                  children: [
                    TableCellWidget(text: "Fee (THB)", bold: true),
                    TableCellWidget(text: prices[0]),
                    TableCellWidget(text: prices[1]),
                    TableCellWidget(text: prices[2]),
                    TableCellWidget(text: prices[3]),
                    TableCellWidget(text: prices[4]),
                    TableCellWidget(text: prices[5]),
                    TableCellWidget(text: prices[6]),
                  ],
                ),
              ],
            ),
          ),
        )

      ],
    );
  }
}
