library grocery_list_component;

import 'package:angular/angular.dart';

import 'package:grocery_store/row.dart';
import 'package:grocery_store/item.dart';

import 'package:grocery_store/item_repository.dart';

@Component(
    selector: 'grocery-list',
    templateUrl: 'packages/grocery_store/grocery_list.html')
class GroceryListComponent {
  @NgOneWay("rowsToDisplay")
  List<Row> rowsToDisplay;
  @NgTwoWay('itemToAdd')
  String itemToAdd = "tomate";
  List<Item> items;
  ItemRepository itemRepository;

  GroceryListComponent(ItemRepository itemRepository) {
    this.itemRepository = itemRepository;

    onBind();
  }

  void onBind() {
    rowsToDisplay = itemRepository.rowsToDisplay();
    items = itemRepository.getAllItems();
  }

  void addItem() {
    var itemToAdd = itemRepository.getItem(this.itemToAdd);

    if (itemToAdd != null && !itemRepository.listContains(itemToAdd)) {
      itemRepository.addItemToList(itemToAdd)
        .then((updatedItems) => rowsToDisplay = updatedItems);
    }
  }
}
