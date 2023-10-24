library dynamia_tools;

import 'package:dynamia_flutter_tools/navigation/nav_element.dart';
import 'package:dynamia_flutter_tools/navigation/nav_page.dart';
import 'package:dynamia_flutter_tools/navigation/nav_page_group.dart';

class NavModule extends NavElement {
  List<NavPageGroup>? groups;
  List<NavPage>? pages;

  NavModule(super.id, super.name, {this.groups, this.pages}) {
    pages?.forEach((p) {
      p.parent = this;
    });

    groups?.forEach((g) {
      g.parent = this;
    });
  }

  void addPage(NavPage page) {
    pages ??= [];
    pages?.add(page);
    page.parent = this;
  }

  void addPageGroup(NavPageGroup group) {
    groups ??= [];
    groups?.add(group);
    group.parent = this;
  }
}
