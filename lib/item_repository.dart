library repository;

import 'package:grocery_store/item.dart';
import 'package:grocery_store/row.dart';

import 'package:angular/angular.dart';

import 'dart:async';

@Injectable()
class ItemRepository {
  List<Row> rows;
  List<Row> listItems;
  List<Row> rowsToDisplay() => listItems;
  Scope scope;

  ItemRepository(this.scope) {
    rows = _loadRows();
    listItems = _loadRows()
      ..forEach((r) => r.items.clear());
  }

  void addNewRow(String rowName) {
    Row newRow = new Row(rowName);

    rows.add(newRow);

    scope.broadcast("row-added", rows);
  }

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

    Row viande = new Row('viande');
    viande.items = [
        new Item('boeuf haché'),
        new Item('boeuf fondue'),
        new Item('poitrine poulet'),
        new Item('veau haché'),
        new Item('poulet fondue'),
        new Item('filet de porc'),
    ];

    Row charcuterie = new Row('charcuterie');
    charcuterie.items = [
        new Item('bacon'),
        new Item('pancetta'),
        new Item('procutto'),
        new Item('jambon'),
        new Item('dinde'),
        new Item('roast beef'),
    ];

    Row poisson = new Row('poisson');
    poisson.items = [
        new Item("saumon"),
        new Item("truite"),
        new Item("tilapia"),
        new Item("crevettes"),
        new Item("crabe"),
    ];

    Row produitsLaitiers = new Row('produits laitiers');
    produitsLaitiers.items = [
        new Item("lait"),
        new Item("yogourt"),
        new Item("yogourt grec"),
        new Item("yogourt nature"),
        new Item("yogourt vanille"),
        new Item("crème sure"),
        new Item("fromage"),
        new Item("parmesan"),
        new Item("crabe"),
    ];

    Row pain = new Row('pain');
    pain.items = [
        new Item("pain baguette"),
        new Item("pain déjeuner"),
        new Item("bagels"),
        new Item("muffins anglais"),
    ];


    rows = [fruits, legumes, viande, poisson, charcuterie, pain, produitsLaitiers];

    return rows;
  }
}