import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_json_reporter_bug/main.dart';

void main() {
  group('Counter', () {
    testWidgets(
      'is incremented when plus is tapped',
      (WidgetTester tester) async {
        await tester.pumpWidget(MyApp(counterSeed: 0));

        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);

        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        expect(find.text('0'), findsNothing);
        expect(find.text('1'), findsOneWidget);
      },
    );

    testWidgets(
      'is decremented when minus is tapped',
      (WidgetTester tester) async {
        await tester.pumpWidget(MyApp(counterSeed: 10));

        expect(find.text('0'), findsOneWidget);
        expect(find.text('-1'), findsNothing);

        await tester.tap(find.byIcon(Icons.remove));
        await tester.pump();

        expect(find.text('0'), findsNothing);
        expect(find.text('-1'), findsOneWidget);
      },
    );
  });
}
