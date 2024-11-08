import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khongmongkol/screen/search_screen.dart'; // ตรวจสอบเส้นทาง

void main() {
  testWidgets('SearchScreen displays a list of items and allows searching', (WidgetTester tester) async {
    // สร้าง widget
    await tester.pumpWidget(const MaterialApp(
      home: SearchScreen(),
    ));

    // ตรวจสอบว่ามี TextField และ ListView อยู่ในหน้าจอ
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);

    // กรอกข้อความค้นหา
    await tester.enterText(find.byType(TextField), 'พระ');
    await tester.pump(); // Rebuild the widget with the new state

    // ตรวจสอบรายการที่คาดว่าจะพบ
    expect(find.text('พระพุทธรูปปางห้ามญาติ'), findsOneWidget);
    expect(find.text('พระรอด'), findsOneWidget);
    expect(find.text('พระสมเด็จวัดระฆัง'), findsOneWidget);
    expect(find.text('พระแก้วมรกต'), findsOneWidget);
    expect(find.text('พระโพธิสัตว์กวนอิม'), findsOneWidget);
    expect(find.text('พระแม่อุมาเทวี'), findsOneWidget);

    // ตรวจสอบรายการที่ไม่ควรพบ
    expect(find.text('ต้นมะพร้าว'), findsNothing);
  });
}
