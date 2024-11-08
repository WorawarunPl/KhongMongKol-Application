import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:khongmongkol/screen/structure.dart';

class Wall3Screen extends StatefulWidget {
  const Wall3Screen({Key? key}) : super(key: key);

  @override
  _Wall3ScreenState createState() => _Wall3ScreenState();
}

class _Wall3ScreenState extends State<Wall3Screen> {
  // เก็บจำนวนดาวน์โหลด
  List<int> downloadCounts = List.filled(12, 0);

  final List<Map<String, String>> boxDetails = [
    {
      'image': 'assets/wallpaper/พระแม่-1.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 1',
      'description': 'เสริมเสน่ห์เมตตามหานิยม ความรัก หรือความร่ำรวยทั้งทรัพย์สินและเงินทอง',
    },
    {
      'image': 'assets/wallpaper/พระแม่-2.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 2',
      'description':
          'วอลเปเปอร์พระแม่ลักษมี การ์ตูน น่ารักๆ เสริมความร่ำรวย มั่งมี ความรักสมหวัง',
    },
    {
      'image': 'assets/wallpaper/พระแม่-3.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 3',
      'description':
          'วอลเปเปอร์พระแม่ลักษมี การ์ตูน น่ารักๆ พร้อมบทสวดบูชา',
    },
    {
      'image': 'assets/wallpaper/พระแม่-4.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 4',
      'description':
          'วอลเปเปอร์พระแม่ลักษมี การ์ตูน น่ารักๆ พร้อมบทสวดบูชา',
    },
    {
      'image': 'assets/wallpaper/พระแม่-5.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 5',
      'description':
          'วอลเปเปอร์พระแม่ลักษมี การ์ตูน เสริมความรัก คู่ครอง',
    },
    {
      'image': 'assets/wallpaper/พระแม่-6.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 6',
      'description':
          'วอลเปเปอร์พระแม่ลักษมี มินิมอล เสริมความรัก บารมี',
    },
    {
      'image': 'assets/wallpaper/พระแม่-7.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 7',
      'description': 'วอลเปเปอร์พระแม่ลักษมี สีม่วงชมพู เสริมความรัก ความรักดี',
    },
    {
      'image': 'assets/wallpaper/พระแม่-8.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 8',
      'description':
          'วอลเปเปอร์พระแม่ลักษมี เสริมความสำเร็จชีวิต สำเร็จทุกประการ',
    },
    {
      'image': 'assets/wallpaper/พระแม่-9.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 9',
      'description':
          'วอลเปเปอร์พระแม่ลักษมีและพระพิฆเนศ การ์ตูน น่ารักๆ ',
    },
    {
      'image': 'assets/wallpaper/พระแม่-10.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 10',
      'description':
          'วอลเปเปอร์พระแม่ลักษมีและพระพิฆเนศ การ์ตูน น่ารักๆ ',
    },
    {
      'image': 'assets/wallpaper/พระแม่-11.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 11',
      'description':
          'วอลเปเปอร์พระแม่ลักษมี การ์ตูน น่ารัก เสริมการเงิน การงาน ความรัก ',
    },
    {
      'image': 'assets/wallpaper/พระแม่-12.jpg',
      'title': 'วอลเปเปอร์พระแม่ลักษมีแบบ 12',
      'description':
          'วอลเปเปอร์พระแม่ลักษมี การ์ตูน น่ารัก เสริมการเงิน การงาน ความรัก ',
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadDownloadCounts(); // เรียกฟังก์ชันโหลดจำนวนครั้งที่ดาวน์โหลดเมื่อเปิดหน้า
  }

  // ฟังก์ชันโหลดจำนวนดาวน์โหลดจาก shared_preferences
  Future<void> _loadDownloadCounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < downloadCounts.length; i++) {
      downloadCounts[i] = prefs.getInt('wall3_download_$i') ?? 0;
    }
    setState(() {});
  }

  Future<void> _saveDownloadCount(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('wall3_download_$index', downloadCounts[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Structure(
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wallpaper.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Back button
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    color: const Color(0xFF8B5F32),
                    child: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Back',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ListView for the boxes
          Positioned(
            top: 60.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.5,
                ),
                itemCount: boxDetails.length,
                itemBuilder: (context, index) {
                  final box = boxDetails[index];

                  return Stack(
                    children: <Widget>[
                      // Card for the box
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 12),
                            Center(
                              child: Image.asset(
                                box['image']!,
                                height: 180,
                                width: 150,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      box['title']!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  // download button
                                  IconButton(
                                    icon: const Icon(
                                      Icons.download,
                                      color: Colors.yellow,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        downloadCounts[index]++;
                                      });
                                      _saveDownloadCount(
                                          index); // บันทึกจำนวนครั้งที่ดาวน์โหลด

                                      // Show Snackbar
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                              'ดาวน์โหลดวอลเปเปอร์เรียบร้อยแล้ว !'),
                                          backgroundColor: Colors.green,
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            // description
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                box['description']!,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                downloadCounts[index].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      menuIconColor: const Color.fromARGB(255, 2, 1, 1),
    );
  }
}
