import 'package:flutter/material.dart';

mixin DataTableMixins{
  Widget dataTableWidget({required BuildContext context, required List<DataColumn> columns, required List<DataRow> rows}){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        headingRowColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).primaryColor),
        headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white),
        border: TableBorder(
          top: BorderSide(color: Colors.grey.shade300),
          bottom: BorderSide(color: Colors.grey.shade300),
          left: BorderSide(color: Colors.grey.shade300),
          right: BorderSide(color: Colors.grey.shade300),
        ),
        dividerThickness: 0.5,
        columns: columns,
        rows: rows,
      ),
    );
  }
}