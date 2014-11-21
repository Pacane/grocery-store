library grocery_list_component;

import 'package:angular/angular.dart';

import 'package:grocery_store/row.dart';
import 'package:grocery_store/item.dart';
import 'package:grocery_store/item_repository.dart';

import 'dart:html';

@Component(
    selector: 'grocery-list',
    cssUrl: 'packages/grocery_store/grocery_list.css',
    templateUrl: 'packages/grocery_store/grocery_list.html')
class GroceryListComponent implements ScopeAware, ShadowRootAware {
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
  Scope _scope;
  ShadowRoot shadowRoot;

  GroceryListComponent(this.itemRepository, this.router) {
    this.itemRepository = itemRepository;
    this.router = router;

    onBind();
  }

  void onItemNameChange() {
    shadowRoot.querySelector("#rowDropDown").classes.toggle("hidden", items.any((item) => item.name == itemToAdd));
  }

  void onBind() {
    rowsToDisplay = itemRepository.rowsToDisplay();
    items = itemRepository.getAllItems();
    rows = itemRepository.rows;
  }

  void updateRows(ScopeEvent e) {
    this.rows = e.data;
    router.go("root", {});
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
    router.go("addItem", {});
  }

  void revealAddRow() {
    router.go("addRow", {});
  }

  void set scope(Scope scope) {
    _scope = scope;

    _scope.on("row-added").listen(updateRows);
  }

  void onShadowRoot(ShadowRoot shadowRoot) {
    this.shadowRoot = shadowRoot;
  }
}
