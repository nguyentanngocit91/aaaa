import 'package:flutter/material.dart';

mixin DataTableMixins {
  DataTable dataTableWidget({
    required BuildContext context,
    required List<DataColumn> columns,
    required List<DataRow> rows,
    void Function(bool?)? onSelectAll,
    int? sortColumnIndex,
    bool sortAscending = true,
  }) {
    final Color borderColor = Colors.grey.shade300;
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith(
          (states) => Theme.of(context).primaryColor),
      headingTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
      border: TableBorder(
        top: BorderSide(color: borderColor),
        bottom: BorderSide(color: borderColor),
        left: BorderSide(color: borderColor),
        right: BorderSide(color: borderColor),
      ),
      dividerThickness: 0.5,
      columns: columns,
      rows: rows,
      onSelectAll: onSelectAll,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
    );
  }
}
