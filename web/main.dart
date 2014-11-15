library grocery_list_app;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:grocery_store/grocery_list_component.dart';
import 'package:grocery_store/row_component.dart';
import 'package:grocery_store/item_component.dart';
import 'package:grocery_store/item_repository.dart';
import 'package:angular_node_bind/angular_node_bind.dart';
import 'package:grocery_store/routing/grocery_store_router.dart';
import 'package:grocery_store/add_item_component.dart';

import 'package:logging/logging.dart';

class MyAppModule extends Module {
  MyAppModule() {
    bind(GroceryListComponent);
    bind(ListRowComponent);
    bind(ListItemComponent);
    bind(AddItemComponent);
    bind(ItemRepository);
    bind(RouteInitializerFn, toValue: routeInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
  }
}

void main() {
  Logger.root..level = Level.FINEST
             ..onRecord.listen((LogRecord r) { print(r.message); });

  applicationFactory()
      .addModule(new MyAppModule())
      .addModule(new NodeBindModule())
      .run();
}
