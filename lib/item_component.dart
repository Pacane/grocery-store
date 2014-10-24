library item_component;

import 'package:angular/angular.dart';
import 'package:grocery_store/item.dart';

@Component(
    selector: 'item',
    templateUrl: 'packages/grocery_store/item_component.html')
class ListItemComponent {
    @NgTwoWay('item')
    Item item;
}
