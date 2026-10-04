import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tecblog/main.dart';

void main() {
  testWidgets('renders generated app logo asset', (WidgetTester tester) async {
    await tester.pumpWidget(const RootApp());

    expect(find.byType(Image), findsOneWidget);
  });
}
