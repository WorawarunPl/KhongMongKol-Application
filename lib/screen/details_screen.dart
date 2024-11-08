import 'package:flutter/material.dart';
import 'package:khongmongkol/screen/structure.dart'; // Assuming Structure is imported from your project
import 'package:khongmongkol/screen/item_data.dart'; // Import your item data model
import 'package:khongmongkol/screen/map/map1.dart';
import 'package:khongmongkol/screen/map/map2.dart';
import 'package:khongmongkol/screen/map/map3.dart';

class DetailsScreen extends StatelessWidget {
  final String item;

  const DetailsScreen({Key? key, required this.item}) : super(key: key);

  void _openMapScreen(BuildContext context, String mapAd) {
    // Determine which map screen to open based on the address provided
    if (mapAd.isEmpty) return; // No address, no action

    // Use a simple logic to open the corresponding map screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          // Add your logic to select the correct MapScreen here
          if (mapAd.contains("Map1")) {
            return MapScreen1(map_ad1: mapAd);
          } else if (mapAd.contains("Map2")) {
            return MapScreen2(map_ad2: mapAd);
          } else if (mapAd.contains("Map3")) {
            return MapScreen3(map_ad3: mapAd);
          }
          // Default to the first map screen if none matched
          return MapScreen1(map_ad1: mapAd);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the selected item from itemData or provide a default fallback
    final selectedItem = itemData.firstWhere(
      (element) => element.name == item,
      orElse: () => Item('Unknown', 'Details not found', '', '', '', '', '', '', '', '', '', '', '', ''), // Default item if not found
    );

    // Reusable method to create image and text rows with API button
    Widget buildImageTextRow(String? imagePath, String? text, String mapAd) {
      // If imagePath is null or empty, return an empty widget
      if (imagePath == null || imagePath.isEmpty) {
        return const SizedBox.shrink(); // Empty widget if no image
      }

      return Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 100, // Set fixed width for images
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
                  text ?? 'No details available', // Fallback text if null
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8), // Space between text and button
                ElevatedButton(
                  onPressed: () {
                    _openMapScreen(context, mapAd); // Use the correct context
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 229, 229, 229), // Button background color
                    padding: const EdgeInsets.symmetric(vertical: 10), // Increase button height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded button corners
                    ),
                  ),
                  child: const Text(
                    "ดูแผนที่", // "View Map" in Thai
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), // Button text color
                      fontSize: 15, // Button text size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Structure(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Header Row with Back Button
            Row(
              children: [
                // Back Button
                // Container(
                //   width: 40,
                //   height: 40,
                //   color: const Color(0xFF8B5F32),
                //   child: IconButton(
                //     icon: const Icon(
                //       Icons.keyboard_arrow_left,
                //       color: Colors.white,
                //     ),
                //     onPressed: () {
                //       Navigator.of(context).pop();
                //     },
                //   ),
                // ),
                const SizedBox(width: 8),
                // Header Text
                Expanded(
                  child: Text(
                    selectedItem.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Main content container with Scrollbar and SingleChildScrollView
            Expanded(
              child: Scrollbar(
                thumbVisibility: true, // Makes the scrollbar visible
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(24.0), // Adjusted padding here for bigger space
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF000000),
                          const Color(0xFF737373), // Your preferred color
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // First Row: Picture and Details in a Column
                        Column(
                          children: [
                            // Image at the top
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: selectedItem.picture.isNotEmpty
                                  ? Image.asset(
                                      selectedItem.picture,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox(width: 150, height: 150, child: Placeholder()), // Placeholder if image not available
                            ),
                            const SizedBox(height: 16), // Spacing between image and details

                            // Details below the image
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedItem.details.isNotEmpty
                                        ? selectedItem.details
                                        : 'Details not available',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Second Row: First Additional Picture and Address1 (with API button)
                        buildImageTextRow(selectedItem.map_pic1, selectedItem.address1, selectedItem.map_ad1),
                        const SizedBox(height: 16),

                        // Third Row: Second Additional Picture and Address2 (with API button)
                        buildImageTextRow(selectedItem.map_pic2, selectedItem.address2, selectedItem.map_ad2),
                        const SizedBox(height: 16),

                        // Fourth Row: Third Additional Picture and Address3 (with API button)
                        buildImageTextRow(selectedItem.map_pic3, selectedItem.address3, selectedItem.map_ad3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      searchIconColor: const Color.fromARGB(255, 0, 0, 0),
    );
  }
}
