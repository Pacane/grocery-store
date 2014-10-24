library item;

import 'package:angular/angular.dart';

class Item {
  @NgTwoWay("name")
  String name;
  Item(this.name);
}
