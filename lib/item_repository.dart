library repository;

import 'package:grocery_store/item.dart';
import 'package:grocery_store/row.dart';

import 'package:angular/angular.dart';

import 'dart:async';

@Injectable()
class ItemRepository {
  List<Row> rows;
  List<Row> listItems;

  Future<List<Row>> addNewItemToList(String itemName, String rowName) {
    var row = rows.firstWhere((r) => r.name == rowName);
    var listRow = listItems.firstWhere((r) => r.name == rowName);

    var newItem = new Item(itemName);
    row.items.add(newItem);
    listRow.items.add(newItem);

    return new Future(() => listItems);
  }

  List<Item> getAllItems() {
    return rows.expand((r) => r.items).toList();
  }

  Row getCorrespondingRow(Item item) {
    return rows.firstWhere((row) => row.items.contains(item), orElse: () => null);
  }

  Future<List<Row>> addItemToList(Item itemToAdd) {
    var row = getCorrespondingRow(itemToAdd);
    if (row != null) {
      listItems.firstWhere((r) => r.name == row.name).items.add(itemToAdd);
    }

    return new Future(() => listItems);
  }

  bool listContains(Item item) {
    return listItems.any((r) => r.items.contains(item));
  }

  Item getItem(String string) {
    var row = rows.firstWhere((r) => r.items.any((i) => i.name == string), orElse: () => null);
    return row == null ? null : row.items.firstWhere((i) => i.name == string, orElse: () => null);
  }

  ItemRepository() {
    rows = _loadRows();
    listItems = _loadRows()
      ..forEach((r) => r.items.clear());
  }

  List<Row> _loadRows() {
    List<Row> rows = new List();

    Row legumes = new Row('legumes');
    legumes.items = [
        new Item('tomate'),
        new Item('salade'),
        new Item('basilic'),
        new Item('oignon'),
        new Item('gingembre'),
        new Item('ail')
    ];


    Row fruits = new Row('fruits');
    fruits.items = [
        new Item('banane'),
        new Item('pomme'),
        new Item('orange'),
        new Item('mangue'),
    ];


    rows = [legumes, fruits];

    return rows;
  }

  List<Row> rowsToDisplay() => listItems;
}