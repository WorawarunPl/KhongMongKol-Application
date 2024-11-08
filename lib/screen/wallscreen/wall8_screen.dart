import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:khongmongkol/screen/structure.dart';

class Wall8Screen extends StatefulWidget {
  const Wall8Screen({Key? key}) : super(key: key);

  @override
  _Wall8ScreenState createState() => _Wall8ScreenState();
}

class _Wall8ScreenState extends State<Wall8Screen> {
  // เก็บจำนวนดาวน์โหลด
  List<int> downloadCounts = List.filled(10, 0);

  final List<Map<String, String>> boxDetails = [
    {
      'image': 'assets/wallpaper/ทาโรต์-1.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์เสริมโชคลาภ',
      'description':
          '159 พลังอำนาจเมตตามหาศาล สิ่งศักดิ์สิทธิ์คุ้มครอง ผู้ใหญ่อุปถัมภ์ค้ำชู และส่งเสริมความเฮง',
    },
    {
      'image': 'assets/wallpaper/ทาโรต์-2.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์เสริมสติปัญญา',
      'description':
          '145 เสริมดวงด้านหน้าที่การงานก้าวหน้ารุ่งเรือง มีผู้ใหญ่คอยช่วยเหลืออุปถัมภ์',
    },
    {
      'image': 'assets/wallpaper/ทาโรต์-3.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์เสริมพลังความมั่นคง มั่งคั่ง',
      'description':
          '458 ปรับตัวได้ในทุกสถานการณ์ เลือกในสิ่งที่ทำให้ตัวเองประสบความสำเร็จเสมอ',
    },
    {
      'image': 'assets/wallpaper/ทาโรต์-4.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์เสริมดวงเรื่องค้าขาย',
      'description':
          '168 พลังแห่งโชคลาภ เงินทองไหลเวียนไม่รู้จบ หยิบจับอะไรก็เป็นเงินเป็นทอง เสริมดวงเด่นอภิมหาเศรษฐี',
    },
    {
      'image': 'assets/wallpaper/ทาโรต์-5.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์เสริมพลังความรัก',
      'description':
          '789 เลขมังกร เสริมพลังชีวิตอำนาจและความมั่นคง ร่ำรวยเงินทอง อำนาจ บริวาร เสริมดวงเจ้าของธุรกิจ',
    },
    {
      'image': 'assets/wallpaper/ทาโรต์-6.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์เสริมดวงศิลปิน',
      'description':
          '969 เลขดวงศิลปิน เสน่ห์แรง เจ้าสำราญสนุกสนานมีความคิดเป็นของตัวเอง การเงินคล่องมือลื่นไหล',
    },
    {
      'image': 'assets/wallpaper/ทาโรต์-7.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์เสริมดวงธุรกิจ',
      'description':
          '149 เสริมดวงคนค้าขายออนไลน์ ฉลาดพูดและเจรจาต่อรอง เรียนรู้ไว หยิบจับอะไรก็รุ่ง มีคนรักและเมตตาเอ็นดู',
    },
    {
      'image': 'assets/wallpaper/ทาโรต์-8.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์เสริมพลังแห่งสติปัญญา',
      'description':
          '289 เลขหงส์ มีอำนาจวาสนาทรงพลัง มีบริวารคนนับหน้าถือตา การงานประสบความสำเร็จ',
    },
    {
      'image': 'assets/wallpaper/ทาโรต์-9.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์เสริมพลังแห่งชัยชนะ',
      'description':
          '645 เป็นตัวเลขที่มีพลังด้านการค้าขาย รวยเพราะความฉลาด ทำงานได้หลากหลายอาชีพ',
    },
    {
      'image': 'assets/wallpaper/ทาโรต์-10.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์เสริมบารมี ชีวิตรุ่งโรจน์',
      'description':
          '246 เลขเมตตามหานิยม เสริมความรัก ทำให้การติดต่อประสานงานผ่านพ้นไปอย่างราบรื่นไม่ติดขัด',
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
      downloadCounts[i] = prefs.getInt('wall8_download_$i') ?? 0;
    }
    setState(() {});
  }

  Future<void> _saveDownloadCount(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('wall8_download_$index', downloadCounts[index]);
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
