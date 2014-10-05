import 'package:polymer/polymer.dart';
import 'item.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('click-counter')
class ClickCounter extends PolymerElement {
  @published int count = 0;
  @published String name = "";
  ClickCounter.created() : super.created() {
  }

  void increment() {
    count++;
    name = "apple";
  }
}

