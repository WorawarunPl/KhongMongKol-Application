import 'package:flutter_test/flutter_test.dart';

// สร้างฟังก์ชันการกรองแยกจาก state class
List<String> filterItems(List<String> allItems, String query) {
  return allItems
      .where((item) => item.toLowerCase().contains(query.toLowerCase()))
      .toList();
}

void main() {
  // จำลองรายการข้อมูลทั้งหมด
  List<String> allItems = [
    'พระพุทธรูปปางห้ามญาติ', 'พญาครุฑ', 'พระรอด', 'ต้นมะพร้าว', 'ว่านมหาลาภ',
    'ต้นโป๊ยเซียน', 'ทับทิม', 'มูนสโตน', 'โรสควอตซ์', 'พระสมเด็จวัดระฆัง'
    // เพิ่มรายการอื่นๆ ตามต้องการ
  ];

  group('Search Logic Tests', () {
    // ทดสอบการค้นหาที่มีในรายการ
    test('returns filtered items when search query matches', () {
      List<String> result = filterItems(allItems, 'พญาครุฑ');
      expect(result, ['พญาครุฑ']);
    });

    // ทดสอบการค้นหาที่ไม่มีในรายการ
    test('returns empty list when no item matches search query', () {
      List<String> result = filterItems(allItems, 'คำค้นหาที่ไม่มี');
      expect(result, []);
    });

    // ทดสอบค้นหาคำที่ตรงกับหลายรายการ
    test('returns multiple items when search query matches multiple items', () {
      List<String> result = filterItems(allItems, 'พระ');
      expect(result.length, greaterThan(1)); // คาดว่าจะได้มากกว่า 1 รายการ
    });
  });
}
