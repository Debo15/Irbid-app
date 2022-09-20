import 'package:flutter/material.dart';
import 'package:irbid/util/map_category.dart';
import 'package:irbid/widgets/map.dart';

class TourismPage extends StatefulWidget {
  TourismPage({Key? key}) : super(key: key);

  @override
  State<TourismPage> createState() => TourismPageState();
}

class TourismPageState extends State<TourismPage> {
  GlobalKey<MapState> globalKey = GlobalKey<MapState>();

  void updateLocale() {
    globalKey.currentState?.updateLocale();
  }

  @override
  Widget build(BuildContext context) {
    return Map(category: MapCategory.tourism, key: globalKey,);
  }
}
