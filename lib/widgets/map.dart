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
  Set<Marker> healthMarkers = {};

  String img = "";
  String swipeUpTitle = "Explore irbid";
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
          position: const LatLng(32.499780602037994, 35.9923545677307),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/justEdited.jpg";
              swipeUpTitle = S.of(context).just;
              currentBodyText = S.of(context).justTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("Yarmouk"),
          position: const LatLng(32.537977978560164, 35.85526475354011),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/yarmouk.jpg";
              swipeUpTitle = S.of(context).yarmouk;
              currentBodyText = S.of(context).yarmoukTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("Jadara"),
          position: const LatLng(32.42250045841651, 35.947411938240734),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/jadara3.jpg";
              swipeUpTitle = S.of(context).jadara;
              currentBodyText = S.of(context).jadaraTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("Irbid national university"),
          position: const LatLng(32.40652009931654, 35.950331326514934),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/irbidnat3.jpg";
              swipeUpTitle = S.of(context).irbidNational;
              currentBodyText = S.of(context).irbidNationalTalk;
            });
          }),
    };
    historicalTourismMarkers = {
      Marker(
          markerId: const MarkerId("umQais"),
          position: const LatLng(32.65554403869938, 35.687965624227594),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/umQaisMap.jpg";
              swipeUpTitle = S.of(context).umQais;
              currentBodyText = S.of(context).umQaisTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("TabaqetFahl"),
          position: const LatLng(32.438794758312945, 35.59616317731259),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/pella.jpg";
              swipeUpTitle = S.of(context).pella;
              currentBodyText = S.of(context).pellaTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("Saraya"),
          position: const LatLng(32.55794965583602, 35.8480613460222),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/saraya.jpg";
              swipeUpTitle = S.of(context).saraya;
              currentBodyText = S.of(context).sarayaTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("arar"),
          position: const LatLng(32.55755584490767, 35.8466815494231),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/Arrar.jfif";
              swipeUpTitle = S.of(context).ararHouse;
              currentBodyText = S.of(context).ararHouseTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("muath"),
          position: const LatLng(32.60322729386032, 35.61468272685095),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/muath.jfif";
              swipeUpTitle = S.of(context).muath;
              currentBodyText = S.of(context).muathTalk;
            });
          }),
    };

    medicalTourismMarkers = {
      Marker(
          markerId: const MarkerId("shuna"),
          position: const LatLng(32.61122264111856, 35.608291476341165),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/hemmah.jfif";
              swipeUpTitle = S.of(context).shuna;
              currentBodyText = S.of(context).shunaTalk;
            });
          }),
    };

    wildlifeTourismMarkers = {
      Marker(
          markerId: const MarkerId("rashrash"),
          position: const LatLng(32.394121888581644, 35.622390083350666),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/rashrash.jpg";
              swipeUpTitle = S.of(context).rashrash;
              currentBodyText = S.of(context).rashrashTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("Arays"),
          position: const LatLng(32.703645043626686, 35.697083111629134),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/arays.jpg";
              swipeUpTitle = S.of(context).arays;
              currentBodyText = S.of(context).araysTalk;
            });
          }),
    };

    healthMarkers = {
      Marker(
          markerId: const MarkerId("abdullah1"),
          position: const LatLng(32.501454, 35.992111),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/abdullah.png";
              swipeUpTitle = S.of(context).abdullah1;
              currentBodyText = S.of(context).abdullah1Talk;
            });
          }),
      Marker(
          markerId: const MarkerId("basmah"),
          position: const LatLng(32.557426, 35.839134),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/Basma.jfif";
              swipeUpTitle = S.of(context).basmah;
              currentBodyText = S.of(context).basmahTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("bade3h"),
          position: const LatLng(32.529073, 35.834354),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/bade3h.png";
              swipeUpTitle = S.of(context).bade3h;
              currentBodyText = S.of(context).bade3hTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("rahbat"),
          position: const LatLng(32.526286, 35.869365),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/rahbat.jfif";
              swipeUpTitle = S.of(context).rahbat;
              currentBodyText = S.of(context).rahbatTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("islamic"),
          position: const LatLng(32.549091, 35.859162),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/IslamicHos.jpg";
              swipeUpTitle = S.of(context).islamic;
              currentBodyText = S.of(context).islamicTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("specialty"),
          position: const LatLng(32.534225, 35.862602),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/specialty.jpg";
              swipeUpTitle = S.of(context).specialty;
              currentBodyText = S.of(context).specialtyTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("ibnNafees"),
          position: const LatLng(32.536238, 35.867349),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/ibnNafees.jpg";
              swipeUpTitle = S.of(context).ibnNafees;
              currentBodyText = S.of(context).ibnNafeesTalk;
            });
          }),
      Marker(
          markerId: const MarkerId("aydon"),
          position: const LatLng(32.503402, 35.864986),
          onTap: () {
            _pc.open();
            setState(() {
              markerPressed = true;
              img = "assets/aydon.jfif";
              swipeUpTitle = S.of(context).aydon;
              currentBodyText = S.of(context).aydonTalk;
            });
          }),
    };
    switch (widget.category) {
      case MapCategory.education:
        markers = educationMarkers;
        break;
      case MapCategory.health:
        markers = healthMarkers;
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
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: _pc,
      parallaxEnabled: true,
      collapsed: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            )),
        child: Center(
          child: Text(
            swipeUpTitle,
          ),
        ),
      ),
      panelBuilder: (sc) => ListView(
        controller: sc,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              child: Image.asset(
                img,
                width: MediaQuery.of(context).size.width,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(swipeUpTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(currentBodyText),
          ),
        ],
      ),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0), topRight: Radius.circular(18.0)),
      body:
      widget.category == MapCategory.tourism ? tourismMap() : regularMap(),
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
