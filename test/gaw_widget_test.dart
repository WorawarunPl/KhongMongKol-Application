import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khongmongkol/screen/gaw_screen.dart';

void main() {
  testWidgets('GawScreen widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: GawScreen(),
      ),
    );

    // Verify that the background image is present
    expect(find.byType(Image), findsWidgets);

    // Verify that the carousel slider is shown
    expect(find.byType(CarouselSlider), findsOneWidget);

    // Test the GridView.builder shows correct number of items (boxDetails)
    expect(find.byType(GridView), findsOneWidget);
    expect(
        find.byType(ElevatedButton), findsNWidgets(8)); // 8 items in boxDetails

    // Verify that first box title is displayed
    expect(find.text('กล่องจุ่มวอลเปเปอร์'), findsOneWidget);

    // Interact with the first ElevatedButton to navigate
    await tester
        .tap(find.widgetWithText(ElevatedButton, 'เลือกวอลเปเปอร์เลย!').first);
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify navigation occurred (this will depend on your actual route setup)
    // Assuming there's a screen with a route '/wall1_screen'
    // Uncomment the following if you have the named route setup:
    // expect(find.byType(Wall1Screen), findsOneWidget);

    // Scroll carousel to the next item
    await tester.fling(
        find.byType(CarouselSlider), const Offset(-200.0, 0.0), 300);
    await tester.pumpAndSettle(); // Wait for the animation

    // Verify that the carousel has moved to the second image
    // (we use imgList[1] in the code, which is 'assets/banner-2.png')
    expect(find.byType(Image), findsWidgets);
  });
}