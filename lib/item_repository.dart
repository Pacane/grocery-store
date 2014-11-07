library repository;

import 'package:grocery_store/item.dart';
import 'package:grocery_store/row.dart';
import 'package:angular/angular.dart';
import 'dart:async';

@Injectable()
class ItemRepository {
  List<Item> getAllItems() {
    return rows.expand((r) => r.items);
  }

  Row getCorrespondingRow(Item item) {
    return rows.firstWhere((row) => row.items.contains(item));
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
    return rows.firstWhere((r) => r.items.any((i) => i.name == string)).items.firstWhere((i) => i.name == string);
  }

  List<Row> rows;
  List<Row> listItems;

  ItemRepository() {
    rows = _loadRows();
    listItems = _loadRows()..forEach((r) => r.items.clear());
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