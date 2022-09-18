import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:irbid/generated/l10n.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  final double widthImage = 150;
  final List<String> IMGs = const <String>[
    'assets/Umm-Qais.jpg',
    'assets/Umm-Qais2.jpg',
    'assets/Umm-Qais3.jpg',
    'assets/Umm-Qais4.jpg',
    'assets/Umm-Qais5.jpg',
    'assets/Umm-Qais6.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(context),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              S.of(context).historyIrbid,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: IMGs.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(IMGs[itemIndex], fit: BoxFit.cover)),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
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
      // right: 20,
      bottom: 10,
      child: Text(
        S.of(context).irbidGovernorateHistory,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
