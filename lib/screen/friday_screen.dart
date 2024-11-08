import 'package:flutter/material.dart';
import 'package:khongmongkol/screen/wid_flower.dart';
import 'package:khongmongkol/screen/wid_khongmon.dart';
import 'package:khongmongkol/screen/wid_jewel.dart';
import 'package:khongmongkol/screen/structure.dart';
import 'package:khongmongkol/screen/item_data.dart';

class FridayScreen extends StatelessWidget {
  const FridayScreen({super.key});

  void khongMong(BuildContext context, String category, String day) {
    final selectedItem = itemData.firstWhere(
      (item) => item.category == category && item.day == day,
      orElse: () =>
          Item('', '', '', '', '', '', '', '', '', '', '', '', '', ''),
    );

    if (selectedItem.name.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WidKhongmon(item: selectedItem, day: day),
        ),
      );
    } else {
      // If no item is found, show a message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Item not found"),
          content: const Text("No item matches this day and category."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  // Function to navigate to the Flower Detail screen
  void flower(BuildContext context, String category, String day) {
    final selectedItem = itemData.firstWhere(
      (item) => item.category == category && item.day == day,
      orElse: () =>
          Item('', '', '', '', '', '', '', '', '', '', '', '', '', ''),
    );

    if (selectedItem.name.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WidFlower(item: selectedItem, day: day),
        ),
      );
    } else {
      // If no item is found, show a message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Item not found"),
          content: const Text("No item matches this day and category."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  // Function to navigate to the KhongMon (Holy Item) Detail screen
  void jewel(BuildContext context, String category, String day) {
    final selectedItem = itemData.firstWhere(
      (item) => item.category == category && item.day == day,
      orElse: () =>
          Item('', '', '', '', '', '', '', '', '', '', '', '', '', ''),
    );

    if (selectedItem.name.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WidJewel(item: selectedItem, day: day),
        ),
      );
    } else {
      // If no item is found, show a message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Item not found"),
          content: const Text("No item matches this day and category."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Structure(
      body: SingleChildScrollView(
        // Wrap the Container with SingleChildScrollView
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wallpaper.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              // Header with back button and title
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    color: const Color(0xFF8B5F32),
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_left,
                          color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'วันศุกร์ (Friday)',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Main Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/fri.png',
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Description text
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0x00000000), // Fully transparent
                       Color(0x00000000), // 50% transparent white
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'ตำนานโหราศาสตร์ไทยกล่าวไว้ว่า พระศุกร์ เป็นเทพยดาอัฏฐเคราะห์ ที่พระอิศวรเจ้าทรงสร้างขึ้นมาจากวัว 21 ตัว มีสีกายปภัสสร วิมานสีทอง ทรงโคอุสุภราชเป็นพาหนะ คนเกิดวันศุกร์ จึงเป็นคนมีความเพียร มีสัจจะ วาจา เป็นคนรักษาคำพูด ขยันการงาน หาทรัพย์ รักษาทรัพย์ จู้จี้ขี้บ่น บ่นได้ทุกเรื่อง ตอนเด็กลำบาก มักกำพร้าพ่อ ตามเกณฑ์ชะตาต้องลำบากถึง 2 ครั้ง แล้วจึงได้ดี และดำรงชีวิตอย่างมีความสุขตลอดอายุขัย',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 16),

              // Holy Item Button (KhongMon)
              _buildCustomButton(
                context,
                'assets/khong.png',
                'วัตถุมงคล',
                () => khongMong(context, 'thing1', 'fri'),
              ),
              const SizedBox(height: 20),

              // Flower Button
              _buildCustomButton(
                context,
                'assets/flowerBG.png',
                'ต้นไม้มงคล',
                () => flower(context, 'plant1', 'fri'),
              ),
              const SizedBox(height: 20),

              // Jewel Button
              _buildCustomButton(
                context,
                'assets/jewel.png',
                'อัญมณีมงคล',
                () => jewel(context, 'gem1', 'fri'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton(BuildContext context, String imagePath,
      String label, VoidCallback onPressed) {
    return SizedBox(
      width: 400,
      height: 100,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF8B5F32)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(imagePath, width: 70, height: 70),
                    const SizedBox(width: 15),
                    Text(
                      label,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                const Text(
                  '>',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
