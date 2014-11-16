library grocery_store_routing;

import 'package:angular/angular.dart';

void routeInitializer(Router router, RouteViewFactory views) {
  views.configure({
      'addItem': ngRoute(
          path: '/addItem',
          view: 'view/AddItem.html'),
      'addRow': ngRoute(
          path: '/addRow',
          view: 'view/AddRow.html'),
      'root': ngRoute(
          path: '/'),
  });
}