// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:irbid/util/tourism_category.dart';

class ToggleTourismTypes extends StatefulWidget {
  final Function() onPress;
  final _isSelected = [
    RestorableBool(false),
    RestorableBool(false),
    RestorableBool(false),
  ];

  ToggleTourismTypes({super.key, required this.onPress});

  @override
  _ToggleTourismTypesState createState() => _ToggleTourismTypesState();
}

class _ToggleTourismTypesState extends State<ToggleTourismTypes>
    with RestorationMixin {
  @override
  String get restorationId => 'toggle_button';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(widget._isSelected[0], 'entertain');
    registerForRestoration(widget._isSelected[1], 'treat');
    registerForRestoration(widget._isSelected[2], 'history');
  }

  @override
  void dispose() {
    for (final restorableBool in widget._isSelected) {
      restorableBool.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(color: Colors.green.shade200),
        child: ToggleButtons(
          onPressed: (index) {
            setState(() {
              widget.onPress();
              widget._isSelected[index].value = !widget._isSelected[index].value;
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
          isSelected:
              widget._isSelected.map((element) => element.value).toList(),
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(" طبيعية "),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(" علاجية "),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(" تاريخية "),
            ),
          ],
        ),
      ),
    );
  }
}
