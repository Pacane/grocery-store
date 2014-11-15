library grocery_store_routing;

import 'package:angular/angular.dart';

void routeInitializer(Router router, RouteViewFactory views) {
  views.configure({
      'add': ngRoute(
          path: '/add',
          view: 'view/AddItem.html'),
  });
}