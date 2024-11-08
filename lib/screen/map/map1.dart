import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen1 extends StatefulWidget {
  final String map_ad1;

  const MapScreen1({Key? key, required this.map_ad1}) : super(key: key);

  @override
  _MapScreen1State createState() => _MapScreen1State();
}

class _MapScreen1State extends State<MapScreen1> {
  late GoogleMapController mapController;
  LatLng? _extractedLatLng; // ตัวแปรเก็บพิกัดที่ดึงมาจากลิงก์
  Set<Marker> _markers = {}; // เก็บ Marker ที่จะเพิ่มในแผนที่

  @override
  void initState() {
    super.initState();
    // เรียกฟังก์ชันดึงพิกัดจากลิงก์
    _extractLatLngFromUrl(widget.map_ad1);
  }

  // ฟังก์ชันดึงพิกัดจากลิงก์
  void _extractLatLngFromUrl(String url) {
    Uri uri = Uri.parse(url);
    if (uri.queryParameters.containsKey('q')) {
      final coords = uri.queryParameters['q']!.split(',');
      final double latitude = double.parse(coords[0]);
      final double longitude = double.parse(coords[1]);

      setState(() {
        _extractedLatLng = LatLng(latitude, longitude); // กำหนดพิกัด
        _markers.add(
          Marker(
            markerId: const MarkerId('extracted-location'),
            position: _extractedLatLng!,
            infoWindow: const InfoWindow(
              title: 'Extracted Location',
              snippet: 'Extracted from URL',
            ),
          ),
        );
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    if (_extractedLatLng != null) {
      // ถ้ามีพิกัด จะทำการตั้งตำแหน่งกล้อง
      mapController.moveCamera(
        CameraUpdate.newLatLngZoom(_extractedLatLng!, 14.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'แผนที่',
          style: TextStyle(color: Colors.white), // เปลี่ยนสีข้อความเป็นสีขาว
        ),
        backgroundColor: Colors.black, // เพิ่มสีพื้นหลัง
      ),
      body: _extractedLatLng == null
          ? Center(child: CircularProgressIndicator()) // รอจนกว่าพิกัดจะถูกดึง
          : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _extractedLatLng!,
                zoom: 14.0,
              ),
              markers: _markers, // แสดง Marker ที่ดึงจากลิงก์
            ),
    );
  }
}
