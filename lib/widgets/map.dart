import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:irbid/util/map_category.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:irbid/pages/tourism_info.dart';

import '../generated/l10n.dart';
import '../languageChangeProvider.dart';
import 'package:provider/provider.dart';

class Map extends StatefulWidget {
  final MapCategory category;

  const Map({super.key, required this.category});

  @override
  State<StatefulWidget> createState() => MapState();
}

class MapState extends State<Map> {
  late final PanelController _pc = PanelController();
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {
    const Marker(markerId: MarkerId("hidden"), visible: false)
  };
  Set<Marker> historicalTourismMarkers = {};
  Set<Marker> medicalTourismMarkers = {};
  Set<Marker> wildlifeTourismMarkers = {};

  String img = "";
  String swipeUpTitle = "";
  String currentBodyText = "";
  String collapsedText = "Default collapsed text.";
  bool markerPressed = false;

  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.36, 35.8123901),
    zoom: 10,
  );

  final List<bool> isSelected = <bool>[false, false, true];
  String currentLocale = "";

  @override
  void initState() {
    currentLocale =
        context.read<LanguageChangeProvider>().currentLocale.languageCode;
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
    historicalTourismMarkers = {
      Marker(
          markerId: const MarkerId("JUST"),
          position: const LatLng(32.6101734, 35.5909965),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/Umm-Qais4.jpg";
              swipeUpTitle = S.of(context).irbidCul;
              currentBodyText = "This is a historical site yada yada.";
            });
          }),
    };

    medicalTourismMarkers = {
      Marker(
          markerId: const MarkerId("Jadara"),
          position: const LatLng(32.4222541, 35.9473864),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              currentBodyText = "This is a medical site yada yada.";
              collapsedText = "This is the first medical site.";
            });
          }),
    };

    wildlifeTourismMarkers = {
      Marker(
          markerId: const MarkerId("Yarmouk"),
          position: const LatLng(32.5363651, 35.852914),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              currentBodyText = "This is a wildlife site yada yada.";
              collapsedText = "This is the first wildlife site.";
            });
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
        markers.addAll(historicalTourismMarkers);
        break;
    }
    super.initState();
  }

  void updateLocale() {
    setState(() {
      currentLocale =
          context.read<LanguageChangeProvider>().currentLocale.languageCode;
    });
    print(currentLocale);
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        controller: _pc,
        panel: Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
            child: ListView(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(img, width: MediaQuery.of(context).size.width,)
                ),
                Text(swipeUpTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text(currentBodyText),
              ],
            ),
          ),
        ),
        collapsed: Center(
          child: Text(
            collapsedText,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(18.0)),
        body: widget.category == MapCategory.tourism
            ? tourismMap()
            : regularMap());
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

  ButtonStyle notSelectedStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.green),
      splashFactory: NoSplash.splashFactory,
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.green.shade500))),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade100));

  ButtonStyle selectedStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.green.shade100),
      splashFactory: NoSplash.splashFactory,
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.green.shade500))),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green));

  Widget tourismMap() {
    return (Stack(
      children: [
        regularMap(),
        Padding(
          //fill the background of the icon.
          padding: currentLocale == "en"
              ? const EdgeInsets.fromLTRB(16, 16, 0, 0)
              : const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        Padding(
          padding: currentLocale == "ar"
              ? const EdgeInsets.fromLTRB(0, 0, 16, 0)
              : EdgeInsets.zero,
          child: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                  builder: (context) => const TourismInfo()))
                  .then((value) => {
                setState(() {
                  currentLocale = context
                      .read<LanguageChangeProvider>()
                      .currentLocale
                      .languageCode;
                })
              });
            },
            color: Colors.blueAccent,
            icon: const Icon(Icons.info, size: 55),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                style: isSelected[0] ? selectedStyle : notSelectedStyle,
                onPressed: () {
                  setState(() {
                    isSelected[0] = !isSelected[0];
                    if (isSelected[0]) {
                      markers.addAll(wildlifeTourismMarkers);
                    } else {
                      markers.removeAll(wildlifeTourismMarkers);
                    }
                  });
                },
                child: const Text(
                  "الطبيعية",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                style: isSelected[1] ? selectedStyle : notSelectedStyle,
                onPressed: () {
                  setState(() {
                    isSelected[1] = !isSelected[1];
                    if (isSelected[1]) {
                      markers.addAll(medicalTourismMarkers);
                    } else {
                      markers.removeAll(medicalTourismMarkers);
                    }
                  });
                },
                child: const Text(
                  "العلاجية",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                style: isSelected[2] ? selectedStyle : notSelectedStyle,
                onPressed: () {
                  setState(() {
                    isSelected[2] = !isSelected[2];
                    if (isSelected[2]) {
                      markers.addAll(historicalTourismMarkers);
                    } else {
                      markers.removeAll(historicalTourismMarkers);
                    }
                  });
                },
                child: const Text(
                  "التاريخية",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
