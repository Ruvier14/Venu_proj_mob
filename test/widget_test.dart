import 'package:flutter_test/flutter_test.dart';
import 'package:venu_proj_mob/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const VenuApp());

    // Verify that the app starts with login screen
    expect(find.text('Venu'), findsOneWidget);
    expect(find.text('Welcome back!'), findsOneWidget);
  });
}
