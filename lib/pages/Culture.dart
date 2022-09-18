// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../ImageContainer.dart';
import '../generated/l10n.dart';

class CulturePage extends StatelessWidget {
  const CulturePage({Key? key}) : super(key: key);
  final double widthImage = 150;
  final List<String> IMGs = const <String>[
    'https://www.saaih.com/files/styles/gallery/public/gallery/%D8%A7%D9%84%D8%A3%D8%B1%D8%AF%D9%86/%D8%A5%D8%B1%D8%A8%D8%AF/Umm-Qais-Jordan-3.jpg',
    'https://www.saaih.com/files/styles/gallery/public/gallery/%D8%A7%D9%84%D8%A3%D8%B1%D8%AF%D9%86/%D8%A5%D8%B1%D8%A8%D8%AF/Umm-Qais-Jordan-2.jpg',
    'https://www.saaih.com/files/styles/gallery/public/gallery/%D8%A7%D9%84%D8%A3%D8%B1%D8%AF%D9%86/%D8%A5%D8%B1%D8%A8%D8%AF/Umm-Qais-Jordan-1.jpg',
    'https://www.sa2eh.com/site-images/sites/default/files/sa2eh-prod/article/c/f/0/aaa3bb577144875e53960279a10e292a27036a6f-241119132255.jpg?preset=v3.0_DYNxDYN&rnd=12344&save-png=1',
    'https://www.sa2eh.com/site-images/sites/default/files/sa2eh-prod/article/c/f/0/27a2679904a34a01143a992de0a3f1995536b2cf-241119132256.jpg?preset=v3.0_DYNxDYN&rnd=12344&save-png=1',
    'https://www.sa2eh.com/site-images/sites/default/files/sa2eh-prod/article/c/f/0/2d7209ccfc1ba90e7f4520f1472c47cb64c72d44-241119132256.jpg?preset=v3.0_DYNxDYN&rnd=12344&save-png=1',
  ];

  Widget _createImagesBar() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: IMGs.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Row(children: [
          createImage(IMGs[index]),
          const SizedBox(
            width: 7,
          )
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(context),
            ],
          ),
          const Divider(),
          Text(
            S.of(context).irbidCul,
          ),
          const Divider(
            color: Colors.white,
          ),
          const Divider(
            height: 4,
            color: Colors.black,
          ),
          SizedBox(height: 150.0, child: _createImagesBar()),
        ],
      ),
    );
  }

  Widget createImage(String src) {
    return ImageFullScreenWrapperWidget(
        child: Image.network(
      src,
      width: widthImage,
    ));
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(seconds: 2),
      child: Image.network(
        "https://www.saaih.com/files/styles/gallery/public/gallery/%D8%A7%D9%84%D8%A3%D8%B1%D8%AF%D9%86/%D8%A5%D8%B1%D8%A8%D8%AF/Umm-Qais-Jordan-1.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle(BuildContext context) {
    return Positioned(

      bottom: 10,
      child: Text(
        S.of(context).irbidCul,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
