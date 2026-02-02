import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:venu_proj_mob/screens/auth/login_screen.dart';

void main() {
  testWidgets('Login screen displays correctly', (WidgetTester tester) async {
    // Build the login screen without Firebase initialization
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Verify that the login screen elements are present
    expect(find.text('Venu'), findsOneWidget);
    expect(find.text('Welcome back!'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsAtLeastNWidgets(1));
  });
}
