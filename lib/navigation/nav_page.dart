library dynamia_tools;


import 'package:dynamia_flutter_tools/navigation/nav_element.dart';
import 'package:flutter/cupertino.dart';

typedef NavPageWidgetBuilder = Widget Function(BuildContext context);

class NavPage extends NavElement {

  NavPageWidgetBuilder builder;

  NavPage(super.id, super.name, this.builder, {super.icon, super.position, super.description, super.parent});
}
