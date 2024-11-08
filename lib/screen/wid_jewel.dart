import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:khongmongkol/screen/item_data.dart';
import 'package:khongmongkol/screen/map/map1.dart';
import 'package:khongmongkol/screen/structure.dart'; // Import Structure

class WidJewel extends StatelessWidget {
  final Item item;
  final String day;

  const WidJewel({Key? key, required this.item, required this.day})
      : super(key: key);

  // ฟังก์ชันเปิดแผนที่
  void _openMapScreen(BuildContext context, String map_ad1) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen1(map_ad1: map_ad1), // ส่ง map_ad ที่ถูกต้อง
      ),
    );
  }

  // Reusable method to create image and text rows with a map button
  Widget buildImageTextRow(String imagePath, String text, String map_ad1) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Builder(
                builder: (BuildContext newContext) {
                  return SizedBox(
                    width: double.infinity, // ขยายปุ่มให้เต็มความกว้าง
                    child: ElevatedButton(
                      onPressed: () {
                        _openMapScreen(newContext, map_ad1); // ส่ง map_ad ที่ถูกต้อง
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 229, 229, 229), // สีพื้นหลังของปุ่ม
                        padding: const EdgeInsets.symmetric(vertical: 12), // เพิ่มความสูงปุ่ม
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // ขอบปุ่มโค้งมน
                        ),
                      ),
                      child: const Text(
                        "ดูแผนที่",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), // สีของข้อความในปุ่ม
                          fontSize: 18, // ขนาดข้อความในปุ่ม
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Structure( // Use Structure instead of Scaffold
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wallpaper.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                // Title Text at the Top
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'อัญมณีมงคล', // Title text
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0), // Padding around item boxes
                      child: _buildBodyContent(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Back button at the top left
          // Positioned(
          //   top: 17,
          //   left: 16,
          //   child: Container(
          //     width: 40,
          //     height: 40,
          //     color: const Color(0xFF8B5F32),
          //     child: IconButton(
          //       icon: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildBodyContent() {
    List<Item> filteredItems = itemData
        .where((item) =>
            (item.category == 'gem1' ||
             item.category == 'gem2' ||
             item.category == 'gem3') &&
             item.day == day)
        .toList();

    List<Widget> thingWidgets = filteredItems.map((filteredItem) {
      return _buildThingContent(
        filteredItem.name,
        filteredItem.picture,
        filteredItem.details,
        filteredItem.address1,
        filteredItem.address2,
        filteredItem.address3,
        filteredItem.map_ad1,
        filteredItem.map_ad2,
        filteredItem.map_ad3,
      );
    }).toList();

    return Column(
      children: thingWidgets,
    );
  }

  Widget _buildThingContent(
    String name,
    String imagePath,
    String details,
    String address1,
    String address2,
    String address3,
    String map_ad1,
    String map_ad2,
    String map_ad3
  ) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.only(bottom: 16.0), // Space between each item
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF000000),
            const Color(0xFF737373),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8), // Space after the image

          // Display item name
          Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8), // Space after name

          Text(
            details,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16), // Space after details
        ],
      ),
    );
  }
}
