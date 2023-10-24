import 'package:dynamia_flutter_tools/navigation/nav_manager.dart';
import 'package:dynamia_flutter_tools/navigation/nav_module.dart';
import 'package:dynamia_flutter_tools/navigation/nav_page.dart';
import 'package:dynamia_flutter_tools/navigation/nav_page_group.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testModule = NavModule('module', 'DynamiaTools', groups: [
    NavPageGroup('group1', 'Group 1', pages: [
      NavPage('page11', 'Page 1.1', (context) => DummyWidget()),
      NavPage('page12', 'Page 1.2', (context) => DummyWidget()),
      NavPage('page13', 'Page 1.3', (context) => DummyWidget()),
    ]),
    NavPageGroup('group2', 'Group 2', pages: [
      NavPage('page21', 'Page 2.1', (context) => DummyWidget()),
      NavPage('page22', 'Page 2.2', (context) => DummyWidget()),
      NavPage('page23', 'Page 2.3', (context) => DummyWidget()),
    ])
  ]);

  NavManager.registerModule(testModule);

  test('should module exist', () {
    expect(NavManager.containsModule('module'), true);
  });

  test('should find page 23', () {
    const path = "module/group2/page23";
    final page = NavManager.findPage(path);
    expect(page != null, true);
  });
}

class DummyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Dummy');
  }
}
