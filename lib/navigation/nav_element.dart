library dynamia_tools;

import 'package:flutter/widgets.dart';

class NavElement {
  final String id;
  final String name;
  IconData? icon;
  double position = 0;
  bool enabled = true;
  bool visible = true;
  int index = 0;
  String? description;
  NavElement? parent;
  String _absolutePath = '';

  NavElement(this.id, this.name,
      {this.icon, this.position = 0, this.description, this.parent});

  String getAbsolutePath() {
    if (_absolutePath.isEmpty) {
      if (parent == null) {
        _absolutePath = id;
      } else {
        _absolutePath = '${parent!.getAbsolutePath()}/$id';
      }
    }
    return _absolutePath;
  }
}
