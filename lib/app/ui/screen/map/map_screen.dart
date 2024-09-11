import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:power_bank/app/ui/screen/drawer/drawer.dart';
import 'package:power_bank/app/ui/widget/filter_button.dart';
import 'package:power_bank/app/ui/widget/map_circle_back.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/widget/info_list_tile.dart';
import 'package:power_bank/app/ui/widget/login_elevated_button.dart';
import 'package:power_bank/app/ui/widget/marker_data.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final MapController _mapController = MapController();
  List<MarkerData> _markerdata = [];
  List<Marker> _marker = [];
  LatLng? _selectPosition;
  LatLng? _mylocation;
  LatLng? _draggedposition;
  bool _isDragging = false;
  double _currentZoom = 13.0;

  void _zoomIn() {
    setState(() {
      _currentZoom = (_currentZoom + 1).clamp(0.0, 18.0);
      _mapController.move(_mapController.camera.center, _currentZoom);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentZoom = (_currentZoom - 1).clamp(0.0, 18.0);
      _mapController.move(_mapController.camera.center, _currentZoom);
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await _checkAndRequestLocationService(context);
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _showCurrentlocation() async {
    try {
      Position position = await _determinePosition();
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);
      _mapController.move(currentLatLng, 15.0);
      setState(() {
        _mylocation = currentLatLng;
      });
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> _checkAndRequestLocationService(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Location Services Disabled'),
          content: const Text(
              'Please enable location services to use this feature.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Geolocator.openLocationSettings();
              },
              child: const Text('Open Settings'),
            ),
          ],
        ),
      );
    }
  }

  void _addMarker(
      LatLng position, String title, String description, String number) {
    setState(() {
      final markerData = MarkerData(
        description: description,
        title: title,
        position: position,
        number: number,
      );
      _markerdata.add(markerData);
      _marker.add(
        Marker(
          point: position,
          width: 25,
          height: 25,
          child: GestureDetector(
            onTap: () {
              _showMarkerInfo(context, markerData);
            },
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          ),
        ),
      );
    });
  }

  void _showMarkerDialog(BuildContext context, LatLng position) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final TextEditingController numberController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('AddMarker'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Desctiption'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: numberController,
              decoration: const InputDecoration(labelText: 'number '),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
            ),
          ),
          TextButton(
            onPressed: () {
              _addMarker(position, titleController.text, descController.text,
                  numberController.text);
              Navigator.pop(context);
            },
            child: const Text(
              'Save',
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _getAddressFromLatLng(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return '${place.street}, ${place.locality}, ${place.country}'; // Manzilni formatlash
      } else {
        return 'No address found';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  void _showMarkerInfo(BuildContext context, MarkerData markerData) {
    showModalBottomSheet(
      context: context,
      builder: (context) => FutureBuilder<String>(
        future: _getAddressFromLatLng(
            markerData.position.latitude, markerData.position.longitude),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final address = snapshot.data ?? 'Address not found';

            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        width: 60,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Text(markerData.title, style: TextStyles.s28w600white),
                    const SizedBox(height: 8),
                    Text(address, style: TextStyles.s18w500grey),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Icon(Icons.access_time_sharp,
                            color: AppColors.deepBlue),
                        SizedBox(width: 4),
                        Text('Open until 22:43', style: TextStyles.s18w500blue),
                        Spacer(),
                        Icon(Icons.near_me_outlined),
                        SizedBox(width: 8),
                        Text(
                          '100 m',
                          style: TextStyles.s18w500grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        InfoListTile(color: true, number: '7'),
                        InfoListTile(color: false, number: '2'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('Working hours', style: TextStyles.s18w500white),
                    const Text('Daily 11:00 - 23:00',
                        style: TextStyles.s18w500grey),
                    const SizedBox(height: 12),
                    const Text('Comment', style: TextStyles.s18w500white),
                    Text(markerData.description, style: TextStyles.s18w500grey),
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tariff', style: TextStyles.s18w500white),
                        Text('0.2\$ / hour', style: TextStyles.s20w500blue),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: LoginElevatedButton(
                        title: 'Get Charge',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _filterBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        height: 340,
        decoration: const BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: 50,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const Text('Filters', style: TextStyles.s28w600white),
              const SizedBox(height: 24),
              Column(
                children: List.generate(3, (index) {
                  final titles = [
                    ['Open Now', 'Works 24/7'],
                    ['Active stations', 'Near a subway'],
                    ['Take only', 'Get back only']
                  ];
                  return Row(
                    children: titles[index]
                        .map((title) => Padding(
                              padding: const EdgeInsets.only(
                                  right: 12.0, bottom: 12.0),
                              child: MapFilterButton(title: title),
                            ))
                        .toList(),
                  );
                }),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: LoginElevatedButton(
                  title: 'Apply',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void moveToLocation(double latitude, double longitude) {
    LatLng location = LatLng(latitude, longitude);
    _mapController.move(location, 15.0);
    setState(() {
      _selectPosition = location;
    });
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // skanerlashda rang
      'Cancel', // bekor qilish tugmasi
      true, // Torch (yashirish/yoritish) ruxsat berish
      ScanMode.QR,
    );
    print('Barcode result: $barcodeScanRes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      key: _scaffoldKey,
      drawer: DrawerScreen(onPressed: () {
        _scaffoldKey.currentState?.closeDrawer();
        setState(() {});
      }),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialZoom: _currentZoom,
              onTap: (tapPosition, latlng) {
                setState(() {
                  _selectPosition = latlng;
                  _draggedposition = _selectPosition;
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(markers: _marker),
              if (_isDragging && _draggedposition != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _draggedposition!,
                      width: 80,
                      height: 80,
                      child: const Icon(
                        Icons.location_on,
                        color: AppColors.deepBlue,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              if (_mylocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _mylocation!,
                      width: 50,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const RadialGradient(
                            colors: [AppColors.white, AppColors.deepBlue],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.circle,
                          color: AppColors.deepBlue,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          Positioned(
            top: 55,
            left: 15,
            child: Container(
              margin: const EdgeInsets.only(right: 14),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: GestureDetector(
                onTap: () {
                  // Drawer-ni ochish
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/vectors/menu.svg',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 55,
              right: 0,
              child: MapCircleItemBack(
                child: GestureDetector(
                  onTap: () {
                    _filterBottomSheet();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset(
                      'assets/vectors/filter.svg',
                    ),
                  ),
                ),
              )),
          _isDragging == false
              ? Positioned(
                  bottom: 20,
                  left: 20,
                  child: FloatingActionButton(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        _isDragging = true;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/vectors/locationadd.svg',
                      color: AppColors.white,
                    ),
                  ),
                )
              : Positioned(
                  bottom: 20,
                  left: 20,
                  child: FloatingActionButton(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        _isDragging = false;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/vectors/locationdone  .svg',
                      color: AppColors.white,
                    ),
                  ),
                ),
          Align(
            alignment: const Alignment(0, 0.95),
            child: InkWell(
              onTap: () {
                scanBarcode();
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [AppColors.deepBlue, AppColors.deeppink],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/vectors/qr.svg',
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    _zoomIn();
                  },
                  child: MapCircleItemBack(
                    child: SvgPicture.asset('assets/vectors/zoomin.svg'),
                  ),
                ),
                const SizedBox(height: 18),
                InkWell(
                  onTap: () {
                    _zoomOut();
                  },
                  child: MapCircleItemBack(
                    child: InkWell(
                      child: SvgPicture.asset('assets/vectors/zoomout.svg'),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                MapCircleItemBack(
                  child: InkWell(
                    onTap: () {
                      _showCurrentlocation();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SvgPicture.asset(
                        'assets/vectors/gps.svg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isDragging)
            Positioned(
              bottom: 90,
              left: 12,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: AppColors.green,
                  foregroundColor: AppColors.white,
                  onPressed: () {
                    if (_draggedposition != null) {
                      _showMarkerDialog(context, _draggedposition!);
                    }
                    setState(() {
                      _isDragging = false;
                      _draggedposition = null;
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/vectors/locationclose.svg',
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
