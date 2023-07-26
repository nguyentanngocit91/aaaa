import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../models/item_search_result_model.dart';
class RestorableDessertSelections extends RestorableProperty<Set<int>> {
  Set<int> _dessertSelections = {};

  /// Returns whether or not a dessert row is selected by index.
  bool isSelected(int index) => _dessertSelections.contains(index);

  /// Takes a list of [Dessert]s and saves the row indices of selected rows
  /// into a [Set].
  void setDessertSelections(List<ItemSearchResultModel> desserts) {
    final updatedSet = <int>{};
    for (var i = 0; i < desserts.length; i += 1) {
      var dessert = desserts[i];
      // if (dessert.selected) {
      //   updatedSet.add(i);
      // }
    }
    _dessertSelections = updatedSet;
    notifyListeners();
  }

  @override
  Set<int> createDefaultValue() => _dessertSelections;

  @override
  Set<int> fromPrimitives(Object? data) {
    final selectedItemIndices = data as List<dynamic>;
    _dessertSelections = {
      ...selectedItemIndices.map<int>((dynamic id) => id as int),
    };
    return _dessertSelections;
  }

  @override
  void initWithValue(Set<int> value) {
    _dessertSelections = value;
  }

  @override
  Object toPrimitives() => _dessertSelections.toList();
}

class DessertDataSource extends DataTableSource {
  DessertDataSource.empty(this.context) {
    desserts = [];
  }

  DessertDataSource(this.context,
      [sortedByCalories = false,
        this.hasRowTaps = false,
        this.hasRowHeightOverrides = false,
        this.hasZebraStripes = false]) {
    desserts = [];
    // if (sortedByCalories) {
    //   sort((d) => d.calories, true);
    // }
  }

  final BuildContext context;
  late List<ItemSearchResultModel> desserts;
  // Add row tap handlers and show snackbar
  bool hasRowTaps = false;
  // Override height values for certain rows
  bool hasRowHeightOverrides = false;
  // Color each Row by index's parity
  bool hasZebraStripes = false;

  void sort<T>(Comparable<T> Function(ItemSearchResultModel d) getField, bool ascending) {
    desserts.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }
  int _selectedCount = 0;
  void updateSelectedDesserts(RestorableDessertSelections selectedRows) {
    _selectedCount = 0;
    for (var i = 0; i < desserts.length; i += 1) {
      var dessert = desserts[i];
      // if (selectedRows.isSelected(i)) {
      //   dessert.selected = true;
      //   _selectedCount += 1;
      // } else {
      //   dessert.selected = false;
      // }
    }
    notifyListeners();
  }

  @override
  DataRow getRow(int index, [Color? color]) {

    assert(index >= 0);
    if (index >= desserts.length) throw 'index > _desserts.length';
    final dessert = desserts[index];
    print(desserts);
    return DataRow2.byIndex(
      index: index,
      // selected: dessert.selected,
      color: color != null
          ? MaterialStateProperty.all(color)
          : (hasZebraStripes && index.isEven
          ? MaterialStateProperty.all(Theme.of(context).highlightColor)
          : null),
      onSelectChanged: (value) {
        // if (dessert.selected != value) {
        //   _selectedCount += value! ? 1 : -1;
        //   assert(_selectedCount >= 0);
        //   dessert.selected = value;
        //   notifyListeners();
        // }
      },

      specificRowHeight:null,
      cells: [
        DataCell(Text('x')),
        DataCell(Text('x')),
        DataCell(Text('x')),
        DataCell(Text('x')),
        DataCell(Text('x')),
        DataCell(Text('x')),
        DataCell(Text('x')),

      ],
    );
  }

  @override
  int get rowCount => desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void selectAll(bool? checked) {
    for (final dessert in desserts) {
      // dessert.selected = checked ?? false;
    }
    _selectedCount = (checked ?? false) ? desserts.length : 0;
    notifyListeners();
  }
}