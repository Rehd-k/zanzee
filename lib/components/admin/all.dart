import 'package:flutter/material.dart';

DataTable buildTable() {
  return DataTable(
    columns: const <DataColumn>[
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Table')),
      DataColumn(
          label: Text(
        'Amount',
        style: TextStyle(overflow: TextOverflow.ellipsis),
      )),
      DataColumn(label: Text('Action')),
    ],
    rows: <DataRow>[
      DataRow(
        cells: <DataCell>[
          const DataCell(Text('John')),
          const DataCell(Text('5')),
          const DataCell(Text('45000')),
          DataCell(
            Column(
              children: [
                InkWell(
                  child: const Icon(Icons.fingerprint),
                  onTap: () {
                    // Edit button action
                  },
                ),
                InkWell(
                  child: const Icon(Icons.fingerprint),
                  onTap: () {
                    // Edit button action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      const DataRow(
        cells: <DataCell>[
          DataCell(Text('Jane Doe')),
          DataCell(Text('Table 2')),
          DataCell(Text('50.00')),
          DataCell(Text('Delete')),
        ],
      ),
    ],
  );
}
