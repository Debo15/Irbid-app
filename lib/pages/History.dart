// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:irbid/ImageContainer.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  final double widthImage = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              createImage("assets/irbid_0.jpg"),

            ],
          )
        ],
      )
    );
  }
  Widget createImage(String src){
    return ImageFullScreenWrapperWidget(child: Image.asset(src, width: widthImage,));
  }
}
