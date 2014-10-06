library grocery_list;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'item.dart';
import 'row.dart';

@Controller(
    selector: '[items]',
    publishAs: 'ctrl')
class RowsController {
  List<Row> rows;

  RowsController() {
    rows = _loadData();
  }

  void moveDownRow(Row row) {
    var index = rows.indexOf(row);
    
    if(index == rows.length-1) {
      return;
    }
    
    Row nextRow = rows.elementAt(index+1);
    rows[index] = nextRow;
    rows[index+1] = row;    
  }

  List<Row> _loadData() {
    Row fruits = new Row("Fruits");
    fruits.items.add(new Item("banane"));
    fruits.items.add(new Item("pomme"));

    Row legumes = new Row("Legumes");
    legumes.items.add(new Item("tomate"));
    legumes.items.add(new Item("laitue"));


    return [fruits, legumes];
  }
}

class MyAppModule extends Module {
  MyAppModule() {
    bind(RowsController);
  }
}

void main() {
  applicationFactory()
      .addModule(new MyAppModule())
      .run();
}
