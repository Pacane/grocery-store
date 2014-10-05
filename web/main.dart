library grocery_list;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'item.dart';

@Controller(
    selector: '[items]',
    publishAs: 'ctrl')
class ItemsController {
  List<Item> items;
  Item selectedItem;

  ItemsController() {
    items = _loadData();
  }
  
  void selectItem(Item item) {
    selectedItem = item;
  }

  List<Item> _loadData() {
    return [
      new Item("Banana", 2.0),
      new Item("Apple", 3.5),
    ];
  }
}

class MyAppModule extends Module {
  MyAppModule() {
    bind(ItemsController);
  }
}

void main() {
  applicationFactory()
      .addModule(new MyAppModule())
      .run();
}
