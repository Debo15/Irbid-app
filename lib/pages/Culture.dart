import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../ImageContainer.dart';
import '../generated/l10n.dart';


class CulturePage extends StatelessWidget {
  const CulturePage({Key? key}) : super(key: key);
  final double widthImage = 150;
  final List<String> IMGs = const <String>[
    'assets/a man.jfif',
    'assets/Arrar.jfif',
    'assets/dehia.jfif',
    'assets/mansaf.jfif'
  ];

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
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              S.of(context).cultureIrbid,
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

      bottom: 10,
      child: Text(
        S.of(context).irbidGovernorateCulture,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
