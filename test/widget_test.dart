import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khongmongkol/screen/monday_screen.dart';
import 'package:khongmongkol/screen/birthdaySearch_screen.dart';

void main() {
  
  testWidgets('Birthday dropdown should contain all days', (WidgetTester tester) async {
    // สร้าง widget birthdaySearch
    await tester.pumpWidget(const MaterialApp(home: birthdaySearch()));

    // ตรวจสอบว่า dropdown ปรากฏอยู่หรือไม่
  expect(find.byKey(const Key('dayDropdown')), findsOneWidget);

  // กดที่ปุ่ม dropdown เพื่อเปิดเมนู
  await tester.tap(find.byKey(const Key('dayDropdown')));
  await tester.pumpAndSettle(); // รอให้ dropdown เปิด

    // ตรวจสอบว่ามีวันทั้งหมดใน dropdown
    expect(find.text('วันจันทร์'), findsOneWidget);
    expect(find.text('วันอังคาร'), findsOneWidget);
    expect(find.text('วันพุธ'), findsOneWidget);
    expect(find.text('วันพฤหัสบดี'), findsOneWidget);
    expect(find.text('วันศุกร์'), findsOneWidget);
    expect(find.text('วันเสาร์'), findsOneWidget);
    expect(find.text('วันอาทิตย์'), findsOneWidget);
  });

  testWidgets('Selecting Monday navigates to MondayScreen', (WidgetTester tester) async {
    // สร้าง widget birthdaySearch และเพิ่มเข้าไปใน widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: const birthdaySearch(),
        routes: {
          '/mondayScreen': (context) => const MondayScreen(),
        },
      ),
    );

    // ตรวจสอบว่า dropdown ปรากฏหรือไม่
    expect(find.byKey(const Key('dayDropdown')), findsOneWidget);

    // กดที่ปุ่ม dropdown เพื่อเปิดเมนู
    await tester.tap(find.byKey(const Key('dayDropdown')));
    await tester.pumpAndSettle(); // รอให้ dropdown เปิด

    // กดเลือกตัวเลือก 'วันจันทร์' จาก dropdown
    await tester.tap(find.text('วันจันทร์').last);
    await tester.pumpAndSettle(); // รอให้ dropdown ปิดและอัปเดต

    // ตรวจสอบว่าตอนนี้ 'วันจันทร์' ถูกเลือกแล้ว
    expect(find.text('วันจันทร์'), findsOneWidget);

    // กดปุ่ม 'send'
    await tester.tap(find.text('send'));
    await tester.pump(); // รอให้ SnackBar ปรากฏ

    // เพิ่มเวลารอเพื่อให้ SnackBar แสดงผลเต็มที่
    await tester.pump(const Duration(seconds: 3));

    // ตรวจสอบว่า SnackBar แสดงข้อความสำเร็จ
    expect(find.text('ประมวลผลสำเร็จ'), findsOneWidget);

    // กดปุ่มใน SnackBar เพื่อนำทางไปยังหน้า MondayScreen
    await tester.tap(find.text('ดูข้อมูลวันจันทร์'));
    await tester.pumpAndSettle(); // รอการนำทาง

    // ตรวจสอบว่าเราได้นำทางไปยังหน้า MondayScreen หรือไม่
    expect(find.byType(MondayScreen), findsOneWidget);
  });
}


