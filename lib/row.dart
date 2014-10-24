library row;

import 'package:grocery_store/item.dart';

class Row {
  List<Item> items;

  String name;

  Row(this.name) {
    items = new List<Item>();
  }
}
