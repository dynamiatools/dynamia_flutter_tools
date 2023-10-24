library dynamia_tools;

import 'package:dynamia_flutter_tools/navigation/nav_module.dart';
import 'package:dynamia_flutter_tools/navigation/nav_page.dart';
import 'package:dynamia_flutter_tools/navigation/nav_page_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum RouterStyle { material, cupertino }

class NavManager {
  static final List<NavModule> _modules = [];
  static final Map<String, NavModule> _modulesMap = {};
  static final Map<String, NavPage> _pagesMap = {};
  static RouterStyle routerStyle = RouterStyle.material;

  static void registerModule(NavModule module) {
    if (!_modulesMap.containsKey(module.id)) {
      _modules.add(module);
      _mapModule(module);
    } else {
      throw ArgumentError("NavModule with id $module.id is already registered");
    }
  }

  static void push(BuildContext context, String path) {
    NavPage? page = findPage(path);
    if (page != null) {
      final navigator = Navigator.of(context);
      if (routerStyle == RouterStyle.material) {
        navigator.push(MaterialPageRoute(
            builder: (context) => page.builder.call(context)));
      } else {
        navigator.push(CupertinoPageRoute(
            builder: (context) => page.builder.call(context)));
      }
    } else {
      throw ArgumentError("NavPage with path $path not found");
    }
  }

  /// Pop the Navigator only if canPop() is true
  static void pop(BuildContext context) {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
    }
  }

  static NavPage? findPage(String path) {
    return _pagesMap[path];
  }

  static void _mapModule(NavModule module) {
    _modulesMap[module.id] = module;
    _mapPages(module.pages);
    _mapPageGroups(module.groups);
  }

  static void _mapPages(List<NavPage>? pages) {
    pages?.forEach((page) {
      _pagesMap[page.getAbsolutePath()] = page;
    });
  }

  static void _mapPageGroups(List<NavPageGroup>? groups) {
    groups?.forEach((group) {
      _mapPages(group.pages);
      if (group.subgroups != null) {
        _mapPageGroups(group.subgroups);
      }
    });
  }

  static containsModule(String moduleId) {
    return _modulesMap.containsKey(moduleId);
  }
}
