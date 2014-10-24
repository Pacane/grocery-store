library row;

import 'package:grocery_store/item.dart';
import 'package:angular/angular.dart';
    
class Row {
 List<Item> items;
 
 @NgTwoWay("name")
 String name;

 Row(this.name) {
   items = new List<Item>();
 }
}
