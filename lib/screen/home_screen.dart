import 'package:flutter/material.dart';
import 'package:khongmongkol/screen/structure.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Structure(
      body: Stack(
        children: <Widget>[
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wallpaper.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Page content
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/home_header.png',
                    height: 30,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  // First row (1st ranked)
                  Center(
                    child: _buildButton(
                      context: context,
                      iconPath: 'assets/1st_home.png',
                      title: 'หลวงปู่ทวด',
                      subtitle:
                          '“ ปิกอัพฝ่าที่กั้น รถไฟชน\nคนขับไร้รอยขีดข่วน\nเพราะห้อยหลวงปู่ทวด ”',
                      additionalIcon: 'assets/1st.png',
                      width: 300,
                      additionalIconWidth: 60,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Second row (2nd and 3rd ranked)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: _buildButton(
                          context: context,
                          iconPath: 'assets/2nd_home.png',
                          title: '\nเหรียญท้าว-\nเวสสุวรรณ',
                          width: 120,
                          additionalIcon: 'assets/2nd.png',
                          additionalIconWidth: 50,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          context: context,
                          iconPath: 'assets/3rd_home.png',
                          title: '\nหลวงพ่อ -\nคูณ',
                          width: 120,
                          additionalIcon: 'assets/3rd.png',
                          additionalIconWidth: 52,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // New title section
                  Image.asset(
                    'assets/home_header2.png',
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 5),

                  // Row with additional content (1 box)
                  _buildSingleBox(
                    context,
                    title: '  Lakshmi  Lotus of Love collection',
                    subtitle: '  กำไลพระแม่ลักษมีเสริมดวงด้านความรัก \n  คอลเล็คชั่นดอกบัวแห่งความรัก',
                    iconPath: 'assets/icon_home1.png',
                    gradientColors: [Color(0xFF000000), Color.fromARGB(255, 204, 139, 74)],
                    bottomRightText: '| RAVIPA',
                  ),
                  const SizedBox(height: 8),

                  // Second row with additional content (1 box)
                  _buildSingleBox(
                    context,
                    title: ' The Classic Necklace สร้อยคอศักดิ์สิทธิ์',
                    subtitle: '  พบกับการผสมผสานระหว่างความศักดิ์สิทธิ์และ\n  ศิลปะร่วมสมัยมาพร้อม 14 ชาร์มมงคล ',
                    iconPath: 'assets/icon_home2.png',
                    gradientColors: [Color(0xFF000000), Color.fromARGB(255, 204, 139, 74)],
                    bottomRightText: '| HARMENSTONE',
                  ),
                  const SizedBox(height: 8),

                  // Third row with additional content (1 box)
                  _buildSingleBox(
                    context,
                    title: 'เปิดจองแล้ววันนี้! พระพิฆเนศเศรษฐีรวยสำเร็จ',
                    subtitle: ' หลวงปู่เถิง ปัญญาวโร สมทบทุนสร้างกำแพงแก้ว\n วัดบ้านอาลัย',
                    iconPath: 'assets/icon_home3.png',
                    gradientColors: [Color(0xFF000000), Color.fromARGB(255, 204, 139, 74)],
                    bottomRightText: '| วัดบ้านอาลัย',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      homeIconColor: const Color.fromARGB(255, 0, 0, 0),
    );
  }

  // Reusable Button Widget with width parameter
  Widget _buildButton({
    required BuildContext context,
    required String iconPath,
    required String title,
    String? subtitle,
    String? additionalIcon,
    required double width,
    required double additionalIconWidth,
  }) {
    return SizedBox(
      height: 120,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF000000), Color.fromARGB(255, 204, 139, 74) ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    iconPath,
                    height: 80,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 14),
                        ),
                    ],
                  ),
                ],
              ),
              if (additionalIcon != null)
                Positioned(
                  right: -4,
                  top: -5,
                  child: Image.asset(
                    additionalIcon,
                    height: additionalIconWidth,
                    width: additionalIconWidth,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Updated method to create a single box with gradient background and title and subtitle
  Widget _buildSingleBox(BuildContext context, {
    required String title,
    required String subtitle,
    required String iconPath,
    required List<Color> gradientColors,
    String? bottomRightText,
  }) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              // Icon positioned at the top left
              Positioned(
                left: 10,
                top: 10,
                child: Image.asset(
                  iconPath,
                  height: 60,
                ),
              ),
              // Title and subtitle text positioned at the top center
              Positioned(
                top: 1,
                left: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              // Optional bottom right text
              if (bottomRightText != null)
                Positioned(
                  right: 10,
                  bottom: -5,
                  child: Text(
                    bottomRightText,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
