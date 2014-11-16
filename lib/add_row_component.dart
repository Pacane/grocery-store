library add_row_component;

import 'package:angular/angular.dart';

import 'package:grocery_store/item_repository.dart';

@Component(
    selector: 'add-row',
    templateUrl: 'packages/grocery_store/add_row.html')
class AddRowComponent {
  ItemRepository itemRepository;

  AddRowComponent(this.itemRepository);

  @NgOneWay("rowName")
  String rowName;

  void save() {
    itemRepository.addNewRow(rowName);
  }
}
