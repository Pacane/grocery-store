library grocery_row;

import 'item.dart';

class Row {
 List<Item> items;
 String name;

 Row(this.name) {
   items = new List<Item>();
 }
}
