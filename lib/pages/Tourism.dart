import 'package:flutter/material.dart';
import 'package:irbid/util/map_category.dart';
import 'package:irbid/widgets/map.dart';

class TourismPage extends StatelessWidget {
  const TourismPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Map(category: MapCategory.tourism);
  }
}
