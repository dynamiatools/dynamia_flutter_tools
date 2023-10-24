library dynamia_tools;

import 'package:dynamia_flutter_tools/navigation/nav_element.dart';
import 'package:dynamia_flutter_tools/navigation/nav_page.dart';

class NavPageGroup extends NavElement {
  List<NavPage>? pages = [];
  List<NavPageGroup>? subgroups;

  NavPageGroup(super.id, super.name,
      {this.pages,
      this.subgroups,
      super.icon,
      super.position,
      super.description,
      super.parent}) {
    pages?.forEach((p) {
      p.parent = this;
    });

    subgroups?.forEach((sg) {
      sg.parent = this;
    });
  }

  void addPage(NavPage page) {
    pages ??= [];
    pages?.add(page);
    page.parent = this;
  }

  void addPageGroup(NavPageGroup subgroup) {
    subgroups ??= [];
    subgroups?.add(subgroup);
    subgroup.parent = this;
  }
}
