import 'package:latlong2/latlong.dart';

class MarkerData {
  final LatLng position;
  final String title;
  final String description;
  final String number;
  MarkerData({
    required this.description,
    required this.title,
    required this.position,
    required this.number,
  });
}
