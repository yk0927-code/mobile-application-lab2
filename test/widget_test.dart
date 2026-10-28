// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:first_flutter_app/main.dart';

void main() {
  testWidgets('Student profile screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StudentInfoApp());

    // Verify that student profile screen title appears.
    expect(find.text('CSS3344 Mobile App Dev - Lab 01'), findsOneWidget);
    expect(find.text('HUONG YEW KONG'), findsOneWidget);
  });
}
