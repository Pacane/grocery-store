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
  String itemToAdd = "patate";
  @NgTwoWay('rowNameToAddItemTo')
  String rowNameToAddItemTo = "legumes";

  List<Item> items;
  List<Row> rows;

  ItemRepository itemRepository;
  Router router;

  GroceryListComponent(ItemRepository itemRepository, Router router) {
    this.itemRepository = itemRepository;
    this.router = router;

    onBind();
  }

  void onBind() {
    rowsToDisplay = itemRepository.rowsToDisplay();
    items = itemRepository.getAllItems();
    rows = itemRepository.rows;
  }

  void addItem() {
    var itemToAdd = itemRepository.getItem(this.itemToAdd);

    if (itemToAdd != null && !itemRepository.listContains(itemToAdd)) {
      itemRepository.addItemToList(itemToAdd)
      .then((updatedItems) => rowsToDisplay = updatedItems);
    } else if (itemToAdd == null) {
      itemRepository.addNewItemToList(this.itemToAdd, rowNameToAddItemTo)
      .then((updatedItems) {
        items = itemRepository.getAllItems();
        rowsToDisplay = updatedItems;
      })
      .catchError((e) => print(e));
    }
  }

  void revealAddItem() {
    router.go("add", {});
  }
}
