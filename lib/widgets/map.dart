import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:irbid/util/map_category.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../toggleMenu.dart';
import '../util/tourism_category.dart';

class Map extends StatefulWidget {
  final MapCategory category;

  const Map({super.key, required this.category});

  @override
  State<StatefulWidget> createState() => _MapState();
}

class _MapState extends State<Map> {
  late final PanelController _pc = PanelController();
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};
  bool markerPressed = false;
  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.36, 35.8123901),
    zoom: 10,
  );

  @override
  void initState() {
    Set<Marker> educationMarkers = {
      Marker(
          markerId: const MarkerId("JUST"),
          position: const LatLng(32.4950392, 35.989037),
          onTap: () {
            _pc.open();
            markerPressed = true;
          }),
      Marker(
          markerId: const MarkerId("Yarmouk"),
          position: const LatLng(32.5363651, 35.852914),
          onTap: () {
            _pc.open();
            markerPressed = true;
          }),
      Marker(
          markerId: const MarkerId("Irbid National University"),
          position: const LatLng(32.4063299, 35.9503206),
          onTap: () {
            _pc.open();
            markerPressed = true;
          }),
      Marker(
          markerId: const MarkerId("Jadara"),
          position: const LatLng(32.4222541, 35.9473864),
          onTap: () {
            _pc.open();
            markerPressed = true;
          }),
    };
    Set<Marker> tourismMarkers = {
      Marker(
          markerId: const MarkerId("JUST"),
          position: const LatLng(32.6101734, 35.5909965),
          onTap: () {
            _pc.open();
            markerPressed = true;
          }),
      Marker(
          markerId: const MarkerId("Yarmouk"),
          position: const LatLng(32.5363651, 35.852914),
          onTap: () {
            _pc.open();
            markerPressed = true;
          }),
      Marker(
          markerId: const MarkerId("Irbid National University"),
          position: const LatLng(32.4063299, 35.9503206),
          onTap: () {
            _pc.open();
            markerPressed = true;
          }),
      Marker(
          markerId: const MarkerId("Jadara"),
          position: const LatLng(32.4222541, 35.9473864),
          onTap: () {
            _pc.open();
            markerPressed = true;
          }),
    };
    switch (widget.category) {
      case MapCategory.education:
        markers = educationMarkers;
        break;
      case MapCategory.health:
        // TODO: Handle this case.
        break;
      case MapCategory.tourism:
        markers = tourismMarkers;
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
          controller: _pc,
          panel: const Center(
            child: Text("Hello world"),
          ),
          collapsed: const Center(
            child: Text(
              "This is the collapsed Widget",
              style: TextStyle(color: Colors.black),
            ),
          ),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(18.0)),
          body: widget.category == MapCategory.tourism
              ? tourismMap()
              : regularMap()),
    );
  }

  Widget regularMap() {
    return (GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: markers,
      initialCameraPosition: _kGooglePlex,
      onCameraMove: (CameraPosition position) async {
        if (markerPressed) {
          GoogleMapController controller = await _controller.future;
          controller.moveCamera(CameraUpdate.newCameraPosition(position));
          markerPressed = false;
        }
      },
    ));
  }

  Widget tourismMap() {
    return (Stack(
      children: [
        regularMap(),
        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.265,
            height: 300,
            child: ToggleTourismTypes(
              onPress: () => null,
            )),
      ],
    ));
  }


}
