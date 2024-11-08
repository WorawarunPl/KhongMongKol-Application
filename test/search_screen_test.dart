import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khongmongkol/screen/search_screen.dart';
import 'package:khongmongkol/screen/details_screen.dart'; // Import for navigation verification

void main() {
  testWidgets('SearchScreen displays a list of items and allows searching', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(
      home: SearchScreen(),
    ));

    //ตรวจสอบว่ามี textfield กับ listview อยู่ในหน้าจอ
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);

    // ตรวจสอบว่า item พวกนี้อยู่ในหน้าจอ
    expect(find.text('พระพุทธรูปปางห้ามญาติ'), findsOneWidget);
    expect(find.text('พระรอด'), findsOneWidget);
    expect(find.text('ต้นมะพร้าว'), findsOneWidget);

    // กรอกข้อความเพื่อใช้การค้นหา
    await tester.enterText(find.byType(TextField), 'พระ');
    await tester.pumpAndSettle(); // Ensure the UI is fully rebuilt after search

    // ตรวจสอบสิ่งที่คาดว่าจะพบหลังค้นหา
    expect(find.text('พระพุทธรูปปางห้ามญาติ'), findsOneWidget);
    expect(find.text('พระรอด'), findsOneWidget);
    expect(find.text('พระแก้วมรกต'), findsOneWidget);
    expect(find.text('พระสมเด็จวัดระฆัง'), findsOneWidget);

    // ตรวจสอบสิ่งที่ไม่ควรพบว่าถูกกรองออก
    expect(find.text('ต้นมะพร้าว'), findsNothing);
    expect(find.text('ทับทิม'), findsNothing);

    // แตะผลลัพธ์กสนค้นหาเพื่อตรวจสอบ navigation
    await tester.tap(find.text('พระพุทธรูปปางห้ามญาติ'));
    await tester.pumpAndSettle();

    // ตรวจสอบการไปหน้า DetailScreen (ข้อมูลถูกส่งไปหรือไม่)
    expect(find.byType(DetailsScreen), findsOneWidget);
    expect(find.text('พระพุทธรูปปางห้ามญาติ'), findsOneWidget);
  });
}
