library grocery_list_component;

import 'package:angular/angular.dart';

import 'package:grocery_store/row.dart';
import 'package:grocery_store/item.dart';

@Component(
    selector: 'grocery-list',
    templateUrl: 'packages/grocery_store/grocery_list.html')
class GroceryListComponent {
  List<Row> rows;

  GroceryListComponent() {
    rows = _loadRows();
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
}
