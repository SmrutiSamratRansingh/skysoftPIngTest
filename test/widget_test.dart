// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:skysoft_app/main.dart';
import 'package:skysoft_app/ping_screen.dart';

void main() {
  testWidgets('Start the google ping and responses',
      (WidgetTester tester) async {
    final pingButton = find.byKey(ValueKey('ping button'));

    await tester.pumpWidget(MyApp());

    tester.tap(pingButton);
    await tester.pump();
    expect(find.byKey(ValueKey('IP')), findsOneWidget);
  });
}
