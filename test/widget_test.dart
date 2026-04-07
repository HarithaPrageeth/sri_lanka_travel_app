import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sri_lanka_travel_app/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SriLankaTravelApp());

    // Verify that the app bar title is displayed
    expect(find.text('Serendipity Sri Lanka'), findsOneWidget);
    
    // Verify that bottom navigation bar exists
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    
    // Verify that home screen shows popular destinations text
    expect(find.text('Popular Destinations'), findsOneWidget);
  });

  testWidgets('Bottom navigation works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SriLankaTravelApp());

    // Verify initial screen is home (shows popular destinations)
    expect(find.text('Popular Destinations'), findsOneWidget);
    
    // Tap on Profile tab
    await tester.tap(find.text('Profile'));
    await tester.pump();
    
    // Verify profile screen shows user name
    expect(find.text('Amara Perera'), findsOneWidget);
    
    // Tap on Home tab again
    await tester.tap(find.text('Home'));
    await tester.pump();
    
    // Verify we're back to home screen
    expect(find.text('Popular Destinations'), findsOneWidget);
  });
}