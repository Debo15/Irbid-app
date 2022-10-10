import 'package:flutter/material.dart';
import 'package:irbid/util/map_category.dart';
import 'package:irbid/widgets/map.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [Map(category: MapCategory.health), Text("حدث خطأ بسيط")]);
  }
}
