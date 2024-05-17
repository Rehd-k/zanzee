import 'package:flutter/material.dart';
import 'package:zanzeeapp/components/admin/orders.dart';
import 'package:zanzeeapp/theme/color.dart';

DataTable buildTable(BuildContext context, List data) {
  return DataTable(
      columns: createHeaders,
      rows: createRow(context, data),
      headingRowColor: WidgetStateProperty.resolveWith((states) => primary));
}

List<DataRow> createRow(BuildContext context, List data) {
  return data
      .map(
        (e) => DataRow(
          onLongPress: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderPage(order: e)));
          },
          cells: <DataCell>[
            DataCell(Text(e['name'])),
            DataCell(Text(e['table'])),
            DataCell(Text(e['totalAmount'])),
          ],
        ),
      )
      .toList();
}

List<DataColumn> get createHeaders {
  return const <DataColumn>[
    DataColumn(label: Text('Name')),
    DataColumn(label: Text('Table')),
    DataColumn(
        label: Text(
      'Amount',
    ))
  ];
}
