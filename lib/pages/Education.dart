import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:irbid/toggleMenu.dart';
import 'package:irbid/util/map_category.dart';
import 'package:irbid/widgets/map.dart';

class EducationPage extends StatelessWidget {
  EducationPage({Key? key}) : super(key: key);

  final Set<Marker> markers = {
    const Marker(
      markerId: MarkerId("JUST"),
      position: LatLng(32.4950392, 35.989037),
    ),
    const Marker(
      markerId: MarkerId("Yarmouk"),
      position: LatLng(32.5363651, 35.852914),
    ),
    const Marker(
      markerId: MarkerId("Irbid National University"),
      position: LatLng(32.4063299, 35.9503206),
    ),
    const Marker(
      markerId: MarkerId("Jadara"),
      position: LatLng(32.4222541, 35.9473864),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return const Map(category: MapCategory.education);
  }
}
