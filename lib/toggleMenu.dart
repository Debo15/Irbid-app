// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ToggleTourismTypes extends StatefulWidget {
  @override
  _ToggleTourismTypesState createState() => _ToggleTourismTypesState();
}
// how to use ...
// Row(
// children: <Widget>[
// Text("hi guys"),
// Expanded(child: ToggleTourismTypes()), <------
// ]
// ),
class _ToggleTourismTypesState extends State<ToggleTourismTypes>
    with RestorationMixin {
  final isSelected = [
    RestorableBool(false),
    RestorableBool(false),
    RestorableBool(false),
  ];

  @override
  String get restorationId => 'toggle_button';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(isSelected[0], 'entertain');
    registerForRestoration(isSelected[1], 'treat');
    registerForRestoration(isSelected[2], 'history');
  }

  @override
  void dispose() {
    for (final restorableBool in isSelected) {
      restorableBool.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        onPressed: (index) {
          setState(() {
            isSelected[index].value = !isSelected[index].value;
          });
        },
        color: Colors.black,
        hoverColor: Colors.green,
        // highlightColor: Colors.green.shade100,
        splashColor: Colors.green.shade500,
        selectedBorderColor: Colors.green,
        borderColor: Colors.green.shade700,
        borderWidth: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        isSelected: isSelected.map((element) => element.value).toList(),
        children: const [
          Text(" استجمام "),
          Text(" علاجية "),
          Text(" تاريخية "),
        ],
      ),
    );
  }
}

