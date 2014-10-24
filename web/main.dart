library grocery_list_app;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:grocery_store/grocery_list_component.dart';
import 'package:grocery_store/row_component.dart';
import 'package:grocery_store/item_component.dart';
import 'package:angular_node_bind/angular_node_bind.dart';

class MyAppModule extends Module {
  MyAppModule() {
    bind(GroceryListComponent);
    bind(ListRowComponent);
    bind(ListItemComponent);
  }
}

void main() {
  applicationFactory()
      .addModule(new MyAppModule())
      .addModule(new NodeBindModule())
      .run();
}
