import 'package:flutter/material.dart';
import 'package:khongmongkol/screen/wid_flower.dart';
import 'package:khongmongkol/screen/wid_khongmon.dart';
import 'package:khongmongkol/screen/wid_jewel.dart';
import 'package:khongmongkol/screen/structure.dart';
import 'package:khongmongkol/screen/item_data.dart';

class TuesdayScreen extends StatelessWidget {
  const TuesdayScreen({super.key});

  // Function to navigate to the Khongmong Detail screen
  void khongMong(BuildContext context, String category, String day) {
    final selectedItem = itemData.firstWhere(
      (item) =>
          item.category == category &&
          item.day == day,
      orElse: () =>
          Item('', '', '', '', '', '', '', '', '', '', '', '', '', ''),
    );

    if (selectedItem.name.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              WidKhongmon(item: selectedItem, day: day),
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
      (item) =>
          item.category == category &&
          item.day == day,
      orElse: () =>
          Item('', '', '', '', '', '', '', '', '', '', '', '', '', ''),
    );

    if (selectedItem.name.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              WidFlower(item: selectedItem, day: day),
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

  // Function to navigate to the Jewel Detail screen
  void jewel(BuildContext context, String category, String day) {
    final selectedItem = itemData.firstWhere(
      (item) =>
          item.category == category &&
          item.day == day,
      orElse: () =>
          Item('', '', '', '', '', '', '', '', '', '', '', '', '', ''),
    );

    if (selectedItem.name.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              WidJewel(item: selectedItem, day: day),
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
      body: SingleChildScrollView( // Make content scrollable
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
                    // Container(
                    //   width: 40,
                    //   height: 40,
                    //   color: const Color(0xFF8B5F32),
                    //   child: IconButton(
                    //     icon: const Icon(Icons.keyboard_arrow_left,
                    //         color: Colors.white),
                    //     onPressed: () {
                    //       Navigator.of(context).pop();
                    //     },
                    //   ),
                    // ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'วันอังคาร (Tuesday)',
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
                    'assets/tue.png',
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
                        Color(0x00000000),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'ตามตำนานโหราศาสตร์ไทย อธิบายไว้ว่า อังคาร เป็นเทพยดาอัฏฐเคราะห์ ที่พระอิศวรผู้เป็นเจ้าทรงสร้างขึ้นมาจากกระบือ 8 ตัว มีกายสีแก้วเพทาย (สีชมพู) วิมานสีทับทิม ทรงกระบือเป็นพาหนะ คนเกิดวันอังคาร จึงมีลักษณะนิสัยเหมือนกระบือ เป็นผู้มีกำลังกล้าแข็ง กล้าหาญ มุมานะ อารมณ์รุนแรงฉุนเฉียว ขยันขันแข็ง เป็นนักสู้ ความคิดอ่านว่องไว เป็นคนเจรจาอ่อนหวานมีเล่ห์เหลี่ยม รู้จักการเข้าหาผู้ใหญ่ ญาติมักนำความทุกข์มาให้ ชีวิตต้องผ่านอุปสรรคสี่ครั้ง แล้วจึงจะเป็นสุข',
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
                  () => khongMong(context, 'thing1', 'tue'),
                ),
                const SizedBox(height: 20),

                // Flower Button
                _buildCustomButton(
                  context,
                  'assets/flowerBG.png',
                  'ต้นไม้มงคล',
                  () => flower(context, 'plant1', 'tue'),
                ),
                const SizedBox(height: 20),

                // Jewel Button
                _buildCustomButton(
                  context,
                  'assets/jewel.png',
                  'อัญมณีมงคล',
                  () => jewel(context, 'gem1', 'tue'),
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
