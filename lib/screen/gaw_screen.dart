import 'package:flutter/material.dart';
import 'package:khongmongkol/screen/structure.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GawScreen extends StatefulWidget {
  @override
  _GawScreenState createState() => _GawScreenState();
}

class _GawScreenState extends State<GawScreen> {
  final List<String> imgList = [
    'assets/banner-1.png',
    'assets/banner-2.png',
    'assets/banner-3.png',
  ];

  final List<Map<String, dynamic>> boxDetails = [
    {
      'image': 'assets/cover-1.png',
      'title': 'กล่องจุ่มวอลเปเปอร์',
      'route': '/wall1_screen',
    },
    {
      'image': 'assets/cover-2.png',
      'title': 'วอลเปเปอร์การ์ตูน',
      'route': '/wall2_screen',
    },
    {
      'image': 'assets/cover-3.png',
      'title': 'วอลเปเปอร์พระแม่ลักษมี',
      'route': '/wall3_screen',
    },
    {
      'image': 'assets/cover-4.png',
      'title': 'วอลเปเปอร์ตามราศี',
      'route': '/wall4_screen',
    },
    {
      'image': 'assets/cover-5.png',
      'title': 'วอลเปเปอร์ตามวันเกิด',
      'route': '/wall5_screen',
    },
    {
      'image': 'assets/cover-6.png',
      'title': 'เสริมการเรียน',
      'route': '/wall6_screen',
    },
    {
      'image': 'assets/cover-1.png',
      'title': 'วอลเปเปอร์ท้าวเวสสุวรรณ',
      'route': '/wall7_screen',
    },
    {
      'image': 'assets/cover-2.png',
      'title': 'วอลเปเปอร์ไพ่ทาโรต์',
      'route': '/wall8_screen',
    },
  ];

  int _currentIndex = 0;

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

          // Back Button
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Row(
          //       children: <Widget>[
          //         Container(
          //           width: 40,
          //           height: 40,
          //           color: const Color(0xFF8B5F32),
          //           child: IconButton(
          //             icon: const Icon(
          //               Icons.keyboard_arrow_left,
          //               color: Color.fromARGB(255, 255, 255, 255),
          //             ),
          //             onPressed: () {
          //               Navigator.of(context).pop();
          //             },
          //           ),
          //         ),
          //         const SizedBox(width: 8),
          //         const Text(
          //           'Back',
          //           style: TextStyle(
          //             color: Color.fromARGB(255, 255, 255, 255),
          //             fontSize: 20,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // Content
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Carousel Slider
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: imgList
                        .map((item) => Container(
                              child: Center(
                                child: Image.asset(item,
                                    fit: BoxFit.cover, width: 1000),
                              ),
                            ))
                        .toList(),
                  ),

                  // Dots indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.map((url) {
                      int index = imgList.indexOf(url);
                      return Container(
                        width: 6.0,
                        height: 6.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Color.fromARGB(255, 77, 77, 77),
                        ),
                      );
                    }).toList(),
                  ),

                  // Grid of Boxes
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 2 / 3,
                      ),
                      itemCount: boxDetails.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                      child: Image.asset(
                                        boxDetails[index]['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: Text(
                                      boxDetails[index]['title'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              boxDetails[index]['route']);
                                        },
                                        child: Ink(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFFFFDE59),
                                                Color(0xFFFFFFFF),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.nature,
                                                  color: Colors.amber,
                                                ),
                                                const SizedBox(width: 8),
                                                const Text(
                                                  'เลือกวอลเปเปอร์เลย!',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (index < 3)
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.thumb_up,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      menuIconColor: Color.fromARGB(255, 2, 1, 1),
    );
  }
}
