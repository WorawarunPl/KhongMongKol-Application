import 'package:flutter/material.dart';
import 'package:khongmongkol/screen/structure.dart';


class birthdaySearch extends StatefulWidget {
  const birthdaySearch({super.key});

  @override
  _BirthdaySearchState createState() => _BirthdaySearchState();
}

class _BirthdaySearchState extends State<birthdaySearch> {
  final List<String> days = [
    'วันจันทร์',
    'วันอังคาร',
    'วันพุธ',
    'วันพฤหัสบดี',
    'วันศุกร์',
    'วันเสาร์',
    'วันอาทิตย์'
  ];

  String? selectedDay;

  void showSuccessSnackBar() {
    if (selectedDay == 'วันจันทร์') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("ประมวลผลสำเร็จ"),
          backgroundColor: const Color.fromARGB(255, 0, 146, 78),
          action: SnackBarAction(
            label: 'ดูข้อมูลวันจันทร์',
            onPressed: () {
              Navigator.pushNamed(context, '/mondayScreen'); // ใช้ pushNamed
            },
          ),
        ),
      );
    } else if (selectedDay == 'วันอังคาร') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("ประมวลผลสำเร็จ"),
          backgroundColor: const Color.fromARGB(255, 0, 146, 78),
          action: SnackBarAction(
            label: 'ดูข้อมูลวันอังคาร',
            onPressed: () {
              Navigator.pushNamed(context, '/tuesdayScreen'); // ใช้ pushNamed
            },
          ),
        ),
      );
    } else if (selectedDay == 'วันพุธ') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("ประมวลผลสำเร็จ"),
          backgroundColor: const Color.fromARGB(255, 0, 146, 78),
          action: SnackBarAction(
            label: 'ดูข้อมูลวันพุธ',
            onPressed: () {
              Navigator.pushNamed(context, '/wednesdayScreen'); // ใช้ pushNamed
            },
          ),
        ),
      );
    } else if (selectedDay == 'วันพฤหัสบดี') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("ประมวลผลสำเร็จ"),
          backgroundColor: const Color.fromARGB(255, 0, 146, 78),
          action: SnackBarAction(
            label: 'ดูข้อมูลวันพฤหัสบดี',
            onPressed: () {
              Navigator.pushNamed(context, '/thursdayScreen'); // ใช้ pushNamed
            },
          ),
        ),
      );
    } else if (selectedDay == 'วันศุกร์') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("ประมวลผลสำเร็จ"),
          backgroundColor: const Color.fromARGB(255, 0, 146, 78),
          action: SnackBarAction(
            label: 'ดูข้อมูลวันศุกร์',
            onPressed: () {
              Navigator.pushNamed(context, '/fridayScreen'); // ใช้ pushNamed
            },
          ),
        ),
      );
    } else if (selectedDay == 'วันเสาร์') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("ประมวลผลสำเร็จ"),
          backgroundColor: const Color.fromARGB(255, 0, 146, 78),
          action: SnackBarAction(
            label: 'ดูข้อมูลวันเสาร์',
            onPressed: () {
              Navigator.pushNamed(context, '/saturdayScreen'); // ใช้ pushNamed
            },
          ),
        ),
      );
    } else if (selectedDay == 'วันอาทิตย์') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("ประมวลผลสำเร็จ"),
          backgroundColor: const Color.fromARGB(255, 0, 146, 78),
          action: SnackBarAction(
            label: 'ดูข้อมูลวันอาทิตย์',
            onPressed: () {
              Navigator.pushNamed(context, '/sundayScreen'); // ใช้ pushNamed
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Structure(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                key: const Key('dayDropdown'),
                hint: const Text(
                  'เลือกวันเกิดของท่าน',
                  style: TextStyle(color: Colors.white),
                ),
                value: selectedDay,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800], // Dark background for dropdown
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0, // เพิ่มความสูงของช่อง
                    horizontal: 16.0, // เพิ่มความกว้างด้านข้าง
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                dropdownColor: Colors.grey[900], // Dropdown menu color
                items: days.map((day) {
                  return DropdownMenuItem(
                    value: day,
                    child: Text(
                      day,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDay = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedDay = null; // Reset selection
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 30.0,
                      ),
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      'cancel',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedDay != null && days.contains(selectedDay)) {
                        
                        showSuccessSnackBar();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('กรุณาเลือกวันเกิดก่อนกดปุ่มส่ง'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 30.0,
                      ),
                      backgroundColor: Colors.amber,
                    ),
                    child: const Text(
                      'send',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      menuIconColor: const Color.fromARGB(255, 0, 0, 0),
    );
  }
}
