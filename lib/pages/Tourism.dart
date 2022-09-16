// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:irbid/toggleMenu.dart';

class TourismPage extends StatelessWidget {
  const TourismPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text("this is the Tourism Page"),
          ToggleTourismTypes(),
        ]),
      ),
    );
  }
}
