library item_component;

import 'package:angular/angular.dart';
import 'package:grocery_store/item.dart';
import 'dart:html';

@Component(
    selector: 'item',
    templateUrl: 'packages/grocery_store/item_component.html',
    cssUrl: 'packages/grocery_store/item.css'
)
class ListItemComponent {
    @NgTwoWay('item')
    Item item;

    @NgTwoWay('selected')
    bool selected;

    void onSelect() {

    }
}
