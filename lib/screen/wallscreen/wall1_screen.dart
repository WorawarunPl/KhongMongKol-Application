import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:khongmongkol/screen/structure.dart';

class Wall1Screen extends StatefulWidget {
  const Wall1Screen({Key? key}) : super(key: key);

  @override
  _Wall1ScreenState createState() => _Wall1ScreenState();
}

class _Wall1ScreenState extends State<Wall1Screen> {
  final List<Map<String, String>> _images = [
     {'url': 'assets/wallpaper/วอลการ์ตูน-1.jpg', 'description': 'วอลเปเปอร์มูเตลูแบบปุ๊กปิ๊ก เสริมการงาน การเงิน'},
  {'url': 'assets/wallpaper/วอลการ์ตูน-2.jpg', 'description': 'วอลเปเปอร์มูเตลูแบบปุ๊กปิ๊ก เสริมการเรียน การสอบ สมัครงาน ส่งงานให้อาจารย์/เจ้านาย'},
  {'url': 'assets/wallpaper/วอลการ์ตูน-3.jpg', 'description': 'วอลเปเปอร์มูเตลูแบบปุ๊กปิ๊ก สำหรับคนโสด อยากเริ่มความสัมพันธ์ใหม่'},
  {'url': 'assets/wallpaper/วอลการ์ตูน-4.jpg', 'description': 'วอลเปเปอร์มูเตลูแบบปุ๊กปิ๊ก เน้นงานเข้า เงินเข้า ได้รับโอกาสใหม่ๆ สวยๆรวยๆ เหมาะแก่การค้าขาย'},
  {'url': 'assets/wallpaper/วอลการ์ตูน-5.jpg', 'description': 'วอลเปเปอร์มูเตลูแบบปุ๊กปิ๊ก เสริมความรัก สำหรับคนมีคู่เพื่อประคับประคองความสัมพันธ์ไปสู่วันที่ดี'},
  {'url': 'assets/wallpaper/วอลการ์ตูน-6.jpg', 'description': 'วอลเปเปอร์มูเตลูแบบปุ๊กปิ๊ก เสริมมการงานการเงิน เหมาะสำหรับพ่อค้าแม่ค้า คนทำงานเน้นยอดขาย'},
  {'url': 'assets/wallpaper/วอลการ์ตูน-7.jpg', 'description': 'วอลเปเปอร์มูเตลูแบบปุ๊กปิ๊ก เสริมการเรียน ได้คะแนนดี'},
  {'url': 'assets/wallpaper/วอลการ์ตูน-8.jpg', 'description': 'วอลเปเปอร์มูเตลูแบบปุ๊กปิ๊ก หัวหน้ารัก หัวหน้าหลง หัวหน้าเมตตา'},
  {'url': 'assets/wallpaper/วอลการ์ตูน-9.jpg', 'description': 'วอลเปเปอร์มูเตลูแบบปุ๊กปิ๊ก เกี่ยวกับการเริ่มต้นใหม่ งานใหม่ โอกาสใหม่ๆ'},
  {'url': 'assets/wallpaper/พระแม่-1.jpg', 'description': 'เสริมเสน่ห์เมตตามหานิยม ความรัก หรือความร่ำรวยทั้งทรัพย์สินและเงินทอง'},
  {'url': 'assets/wallpaper/พระแม่-2.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมี การ์ตูน น่ารักๆ เสริมความร่ำรวย มั่งมี ความรักสมหวัง'},
  {'url': 'assets/wallpaper/พระแม่-3.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมี การ์ตูน น่ารักๆ พร้อมบทสวดบูชา'},
  {'url': 'assets/wallpaper/พระแม่-4.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมี การ์ตูน น่ารักๆ พร้อมบทสวดบูชา'},
  {'url': 'assets/wallpaper/พระแม่-5.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมี การ์ตูน เสริมความรัก คู่ครอง'},
  {'url': 'assets/wallpaper/พระแม่-6.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมี มินิมอล เสริมความรัก บารมี'},
  {'url': 'assets/wallpaper/พระแม่-7.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมี สีม่วงชมพู เสริมความรัก ความรักดี'},
  {'url': 'assets/wallpaper/พระแม่-8.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมี เสริมความสำเร็จชีวิต สำเร็จทุกประการ'},
  {'url': 'assets/wallpaper/พระแม่-9.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมีและพระพิฆเนศ การ์ตูน น่ารักๆ'},
  {'url': 'assets/wallpaper/พระแม่-10.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมีและพระพิฆเนศ การ์ตูน น่ารักๆ'},
  {'url': 'assets/wallpaper/พระแม่-11.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมี การ์ตูน น่ารัก เสริมการเงิน การงาน ความรัก'},
  {'url': 'assets/wallpaper/พระแม่-12.jpg', 'description': 'วอลเปเปอร์พระแม่ลักษมี การ์ตูน น่ารัก เสริมการเงิน การงาน ความรัก'},
  {'url': 'assets/wallpaper/ดาวจันทร์.jpg', 'description': 'วอลเปเปอร์เสริมดวงดาวจันทร์'},
  {'url': 'assets/wallpaper/ดาวพฤหัส.jpg', 'description': 'วอลเปเปอร์เสริมดวงดาวพฤหัสบดี'},
  {'url': 'assets/wallpaper/ดาวพุธ.jpg', 'description': 'วอลเปเปอร์เสริมดวงดาวพุธ'},
  {'url': 'assets/wallpaper/ดาวศุกร์.jpg', 'description': 'วอลเปเปอร์เสริมดวงดาวศุกร์'},
  {'url': 'assets/wallpaper/ดาวเสาร์.jpg', 'description': 'วอลเปเปอร์เสริมดวงดาวเสาร์'},
  {'url': 'assets/wallpaper/ดาวอังคาร.jpg', 'description': 'วอลเปเปอร์เสริมดวงดาวอังคาร'},
  {'url': 'assets/wallpaper/ดาวอาทิตย์.jpg', 'description': 'วอลเปเปอร์เสริมดวงดาวอาทิตย์'},
  {'url': 'assets/wallpaper/วันจันทร์-1.jpg', 'description': 'วอลเปเปอร์คนเกิดวันจันทร์'},
  {'url': 'assets/wallpaper/วันพฤหัส-1.jpg', 'description': 'วอลเปเปอร์คนเกิดวันพฤหัสบดี'},
  {'url': 'assets/wallpaper/วันพุธ-1.jpg', 'description': 'วอลเปเปอร์คนเกิดวันพุธ'},
  {'url': 'assets/wallpaper/วันศุกร์-1.jpg', 'description': 'วอลเปเปอร์คนเกิดวันศุกร์'},
  {'url': 'assets/wallpaper/วันเสาร์-1.jpg', 'description': 'วอลเปเปอร์คนเกิดวันเสาร์'},
  {'url': 'assets/wallpaper/วันอังคาร-1.jpg', 'description': 'วอลเปเปอร์คนเกิดวันอังคาร'},
  {'url': 'assets/wallpaper/วันอาทิตย์-1.jpg', 'description': 'วอลเปเปอร์คนเกิดวันอาทิตย์'},
  {'url': 'assets/wallpaper/เรียน-1.png', 'description': 'การเรียนการสอน'},
  {'url': 'assets/wallpaper/เรียน-2.png', 'description': 'การเรียนการแข่งขัน'},
  {'url': 'assets/wallpaper/เรียน-3.png', 'description': 'การเรียน ประสบความสำเร็จ'},
  {'url': 'assets/wallpaper/เรียน-4.png', 'description': 'เทพแห่งแสงสว่าง'},
  {'url': 'assets/wallpaper/เรียน-5.png', 'description': 'ประสบความสำเร็จ เป็นที่ยอมรับ'},
  {'url': 'assets/wallpaper/เรียน-6.png', 'description': 'จัดการความเครียด'},
  {'url': 'assets/wallpaper/เรียน-7.png', 'description': 'สอบติด'},
  {'url': 'assets/wallpaper/เรียน-8.png', 'description': 'คะแนนสอบดั่งใจหวัง'},
  {'url': 'assets/wallpaper/เรียน-9.png', 'description': 'ความจำดี ติดสมอง'},
  {'url': 'assets/wallpaper/เรียน-10.png', 'description': 'เดาข้อสอบถูก'},
  {'url': 'assets/wallpaper/เรียน-11.png', 'description': 'บรรลุเป้าหมาย'},
  {'url': 'assets/wallpaper/เรียน-12.png', 'description': 'ความฉลาดทางวิชาการ ทางการศึกษา'},
  {'url': 'assets/wallpaper/ท้าวเวส-สี-1.jpg', 'description': 'เหมาะสำหรับผู้ที่เกิด วันอาทิตย์ วันพุธกลางวัน วันพฤหัสบดี วันศุกร์  วันเสาร์'},
  {'url': 'assets/wallpaper/ท้าวเวส-สี-2.jpg', 'description': 'เหมาะสำหรับผู้ที่เกิด วันอาทิตย์ วันจันทร์ วันพุธกลางวัน วันพฤหัสบดี วันศุกร์'},
  {'url': 'assets/wallpaper/ท้าวเวส-สี-3.jpg', 'description': 'เหมาะสำหรับผู้ที่เกิด วันอาทิตย์ วันพุธกลางวัน วันพุธกลางคืน วันพฤหัสบดี วันศุกร์ วันเสาร์'},
  {'url': 'assets/wallpaper/ท้าวเวส-สี-4.jpg', 'description': 'เหมาะสำหรับผู้ที่เกิด วันจันทร์ วันอังคาร วันพุธกลางคืน วันพฤหัสบดี วันศุกร์'},
  {'url': 'assets/wallpaper/ท้าวเวส-สี-5.jpg', 'description': 'เหมาะสำหรับผู้ที่เกิด วันอาทิตย์ วันจันทร์ วันอังคาร วันพุธกลางวัน วันพฤหัสบดี วันศุกร์ วันเสาร์'},
  {'url': 'assets/wallpaper/ท้าวเวส-สี-6.jpg', 'description': 'เหมาะสำหรับผู้ที่เกิด วันจันทร์ วันพุธกลางวัน วันพุธกลางคืน วันพฤหัสบดี วันศุกร์'},
  {'url': 'assets/wallpaper/ท้าวเวส-สี-7.jpg', 'description': 'เหมาะสำหรับผู้ที่เกิด วันอาทิตย์ วันจันทร์  วันพุธกลางวัน วันพุธกลางคืน วันศุกร์  วันเสาร์'},
  {'url': 'assets/wallpaper/ทาโรต์-1.png', 'description': '159 พลังอำนาจเมตตามหาศาล'},
  {'url': 'assets/wallpaper/ทาโรต์-2.png', 'description': '145 เสริมดวงด้านหน้าที่การงานก้าวหน้ารุ่งเรือง'},
  {'url': 'assets/wallpaper/ทาโรต์-3.png', 'description': '458 ปรับตัวได้ในทุกสถานการณ์'},
  {'url': 'assets/wallpaper/ทาโรต์-4.png', 'description': '168 พลังแห่งโชคลาภ'},
  {'url': 'assets/wallpaper/ทาโรต์-5.png', 'description': '789 เลขมังกร เสริมพลังชีวิตอำนาจและความมั่นคง'},
  {'url': 'assets/wallpaper/ทาโรต์-6.png', 'description': '969 เลขดวงศิลปิน เสน่ห์แรง'},
  {'url': 'assets/wallpaper/ทาโรต์-7.png', 'description': '149 เสริมดวงคนค้าขายออนไลน์ ฉลาดพูดและเจรจาต่อรอง'},
  {'url': 'assets/wallpaper/ทาโรต์-8.png', 'description': '289 เลขหงส์ มีอำนาจวาสนาทรงพลัง'},
  {'url': 'assets/wallpaper/ทาโรต์-9.png', 'description': '645 เป็นตัวเลขที่มีพลังด้านการค้าขาย'},
  {'url': 'assets/wallpaper/ทาโรต์-10.png', 'description': '246 เลขเมตตามหานิยม เสริมความรัก'},
  ];

  final Random _random = Random();
  final List<Widget> _cards = [];
  Timer? _timer;
  String? _currentDescription; // ตัวแปรสำหรับเก็บ description ปัจจุบัน

  void addCard() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
        if (timer.tick <= 64) {
          _generateRandomCard();
        } else {
          _timer?.cancel();
          _timer = null;
        }
      });
    }
  }

  void _generateRandomCard() {
    final Map<String, String> image = _images[_random.nextInt(_images.length)];

    Widget card = Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 220,
        height: 400, // ปรับความสูงให้เหมาะสม
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image['url']!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    setState(() {
      _cards.add(card);
      _currentDescription = image['description']; // อัปเดต description ปัจจุบัน
    });
  }

  void _downloadWallpaper() {
    // แสดง SnackBar เมื่อกดปุ่มดาวน์โหลด
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('ดาวน์โหลดวอลเปเปอร์เรียบร้อยแล้ว !'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Structure(
      body: Stack(
        alignment: Alignment.center,
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

          // Main content (scrollable)
          Positioned(
            top: 70.0,
            bottom: 70.0, // ให้เลื่อนขึ้น-ลงได้
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_cards.isNotEmpty) _cards.last, // แสดงการ์ดที่สุ่มล่าสุด
                  if (_currentDescription !=
                      null) // แสดง description ของการ์ดที่สุ่มล่าสุด
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0), // เพิ่มระยะห่างที่นี่
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.8, // จำกัดความกว้างให้พอดีกับหน้าจอ
                        child: Text(
                          _currentDescription!,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                          textAlign: TextAlign.center,
                          softWrap: true, // ตัดเป็นหลายบรรทัดหากข้อความยาว
                        ),
                      ),
                    ),
                  const SizedBox(height: 20), // ระยะห่างด้านล่าง
                ],
              ),
            ),
          ),


          // ปุ่มสำหรับสุ่มภาพและดาวน์โหลด
          Positioned(
            bottom: 20, // ปรับระยะห่างจากด้านล่าง
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: addCard,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFDE59),
                              Color(0xFFFFFFFF),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20), // เพิ่ม padding ให้ปุ่ม
                        child: const Text(
                          'สุ่มวอลเปเปอร์กันเลย !',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20), // เพิ่มระยะห่างระหว่างปุ่ม
                    GestureDetector(
                      onTap: _downloadWallpaper,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFC5A43F), // สีเหลืองสำหรับปุ่มดาวน์โหลด
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20), // เพิ่ม padding ให้ปุ่ม
                        child: const Icon(
                          Icons.download, // ใช้ไอคอนดาวน์โหลดแทน
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      menuIconColor: Color.fromARGB(255, 2, 1, 1),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
