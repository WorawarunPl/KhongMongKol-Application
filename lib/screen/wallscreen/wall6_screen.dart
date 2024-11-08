import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:khongmongkol/screen/structure.dart';

class Wall6Screen extends StatefulWidget {
  const Wall6Screen({Key? key}) : super(key: key);

  @override
  _Wall6ScreenState createState() => _Wall6ScreenState();
}

class _Wall6ScreenState extends State<Wall6Screen> {
  // เก็บจำนวนดาวน์โหลด
  List<int> downloadCounts = List.filled(12, 0);

  final List<Map<String, String>> boxDetails = [
    {
      'image': 'assets/wallpaper/เรียน-1.png',
      'title': 'การเรียนการสอน',
      'description':
          'เหมาะสำหรับคนที่ต้องการเพิ่มไฟความกระตือรือร้นในการเตรียมตัวสอบ ให้มีแรงฮึด ให้มีความพร้อมในการสอบ',
    },
    {
      'image': 'assets/wallpaper/เรียน-2.png',
      'title': 'การเรียนการแข่งขัน',
      'description':
          'เสริมสำหรับสายเรียน มีสมาธิ เรียนเข้าใจ ไม่วอกแวก รับมือกับการบ้าน งานได้ /สอบคะแนนออกมาดี ',
    },
    {
      'image': 'assets/wallpaper/เรียน-3.png',
      'title': 'การเรียน ประสบความสำเร็จ',
      'description':
          'เหมาะสำหรับผู้ที่ต้องการเสริมดวงและหากำลังใจในการบรรลุเป้าหมาย ',
    },
    {
      'image': 'assets/wallpaper/เรียน-4.png',
      'title': 'SUNRISE',
      'description':
          'เทพแห่งแสงสว่าง ที่จะมาเปิดตา เปิดใจ ให้พ้นจากความมืดมนพบเส้นทางชีวิตใหม่ที่สดใส',
    },
    {
      'image': 'assets/wallpaper/เรียน-5.png',
      'title': 'เด็กเส้นใหญ่',
      'description':
          'ไพ่ 3 ถ้วยที่แสดงถึงการทำงานเป็นทีมที่ดีประสพความสำเร็จ การเป็นที่ยอมรับ',
    },
    {
      'image': 'assets/wallpaper/เรียน-6.png',
      'title': 'จัดการความเครียด',
      'description':
          'ช่วยเรื่องการสอบ และเพิ่มสมาธิให้การเตรียมตัวอ่านหนังสือ  สำเร็จลุลวงไปได้ด้วยดี',
    },
    {
      'image': 'assets/wallpaper/เรียน-7.png',
      'title': 'สอบติด',
      'description':
          'เสริมดวงและสร้างกำลังใจให้กับนักเรียนที่กำลังเตรียมตัวสอบเข้ามหาวิทยาลัย',
    },
    {
      'image': 'assets/wallpaper/เรียน-8.png',
      'title': 'คะแนนสอบดั่งใจหวัง',
      'description':
          'เสริมดวงและให้กำลังใจสำหรับผู้ที่ต้องการทำคะแนนสอบได้ตามที่หวัง',
    },
    {
      'image': 'assets/wallpaper/เรียน-9.png',
      'title': 'ความจำดี ติดสมอง',
      'description':
          'เสริมดวงและเพิ่มพลังความจำให้คมชัด',
    },
    {
      'image': 'assets/wallpaper/เรียน-10.png',
      'title': 'เดาข้อสอบถูก',
      'description':
          'ต้องการเสริมดวงด้านการสอบและเดาข้อสอบถูก มีพลังแห่งโชคลาภ',
    },
    {
      'image': 'assets/wallpaper/เรียน-11.png',
      'title': 'บรรลุเป้าหมาย',
      'description':
          'เสริมดวงในการบรรลุเป้าหมาย ทำให้ทุกเป้าหมายของคุณเป็นจริงได้อย่างราบรื่น',
    },
    {
      'image': 'assets/wallpaper/เรียน-12.png',
      'title': 'ความฉลาดทางวิชาการ ทางการศึกษา',
      'description':
          'เหมาะสำหรับคนที่มุ่งมั่นในการพัฒนาความรู้และทักษะการศึกษาของตนเอง ดึงพลังบวกในการเรียน',
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
      downloadCounts[i] = prefs.getInt('wall6_download_$i') ?? 0;
    }
    setState(() {});
  }

  Future<void> _saveDownloadCount(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('wall6_download_$index', downloadCounts[index]);
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
