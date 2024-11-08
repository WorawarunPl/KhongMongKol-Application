import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:khongmongkol/screen/structure.dart';

class Wall5Screen extends StatefulWidget {
  const Wall5Screen({Key? key}) : super(key: key);

  @override
  _Wall5ScreenState createState() => _Wall5ScreenState();
}

class _Wall5ScreenState extends State<Wall5Screen> {
  // เก็บจำนวนดาวน์โหลด
  List<int> downloadCounts = List.filled(7, 0);

  final List<Map<String, String>> boxDetails = [
    {
      'image': 'assets/wallpaper/วันจันทร์-1.jpg',
      'title': 'วอลเปเปอร์คนเกิดวันจันทร์',
      'description':
          'เหมาะกับคนเกิดวันจันทร์หรือคนต้องการประสบความสำเร็จด้านการเรียน พิชิตการสอบแข่งขัน เรียกเงินเรียกทองให้ผู้ใช้ด้วย',
    },
    {
      'image': 'assets/wallpaper/วันอังคาร-1.jpg',
      'title': 'วอลเปเปอร์คนเกิดวันอังคาร',
      'description':
          'ตั้งแล้วเรียกทรัพย์ให้แบบไม่ขาดสาย เสริมการอดออม เงินเข้าหลายทาง เฮงเรื่องเงินที่สุด',
    },
    {
      'image': 'assets/wallpaper/วันพุธ-1.jpg',
      'title': 'วอลเปเปอร์คนเกิดวันพุธ',
      'description':
          'เหมาะกับคนที่มีเงินก้อนโต เก็บเงินไม่อยู่',
    },
    {
      'image': 'assets/wallpaper/วันพฤหัส-1.jpg',
      'title': 'วอลเปเปอร์คนเกิดวันพฤหัสบดี',
      'description':
          'มั่งคั่ง ไม่ว่าจะทำอะไรหยิบจับอะไรก็เป็นเงินเป็นทอง และมีอะไรเป็นชิ้นเป็นอัน สามารถอยู่ได้อย่างแฮปปี้เมื่อถึงคราวเกษียณ',
    },
    {
      'image': 'assets/wallpaper/วันศุกร์-1.jpg',
      'title': 'วอลเปเปอร์คนเกิดวันศุกร์',
      'description':
          'เหมาะกับผู้ที่ต้องพบเจอผู้อื่นบ่อยๆหรือต้องทำงานขาย ทำให้การเจรจาต่อรองราบรื่น ค้าขายคล่องตัว',
    },
    {
      'image': 'assets/wallpaper/วันเสาร์-1.jpg',
      'title': 'วอลเปเปอร์คนเกิดวันเสาร์',
      'description':
          'ส่งเสริมดวงด้านสุขภาพ ให้สุขภาพจิตใจสดใส สุขภาพกายแข็งแรงสดชื่น เรียกทรัพย์ได้ทุกทิศทาง มีงาน/เงินเข้าทุกวัน',
    },
    {
      'image': 'assets/wallpaper/วันอาทิตย์-1.jpg',
      'title': 'วอลเปเปอร์คนเกิดวันอาทิตย์',
      'description':
          'เสริมความรักได้ดีมาก ส่วนเรื่องการเงินก็ปัง การงานก็เลิศ ผู้ใหญ่เมตตาเอ็นดู ผู้คนรักใคร่ ',
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
      downloadCounts[i] = prefs.getInt('wall5_download_$i') ?? 0;
    }
    setState(() {});
  }

  Future<void> _saveDownloadCount(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('wall5_download_$index', downloadCounts[index]);
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
