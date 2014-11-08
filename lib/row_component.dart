library row_component;

import 'package:angular/angular.dart';
import 'package:grocery_store/row.dart';

@Component(
    selector: 'row',
    templateUrl: 'packages/grocery_store/row_component.html')
class ListRowComponent {
  @NgTwoWay('row')
  Row row;
}
