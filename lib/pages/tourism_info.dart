import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:irbid/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../languageChangeProvider.dart';

class TourismInfo extends StatefulWidget {
  const TourismInfo({Key? key}) : super(key: key);

  @override
  State<TourismInfo> createState() => _TourismInfoState();
}

class _TourismInfoState extends State<TourismInfo> {
  final double widthImage = 150;

  final List<String> IMGs = const <String>[
    'assets/Umm-Qais.jpg',
    'assets/Umm-Qais2.jpg',
    'assets/Umm-Qais3.jpg',
    'assets/Umm-Qais4.jpg',
    'assets/Umm-Qais5.jpg',
    'assets/Umm-Qais6.jpg'
  ];
  List<bool> isSelected = [];
  @override
  void initState() {
    setState(() {
      isSelected = [
        context.read<LanguageChangeProvider>().currentLocale.languageCode == "ar",
        context.read<LanguageChangeProvider>().currentLocale.languageCode == "en"];
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(48.0),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ToggleButtons(
                constraints:
                const BoxConstraints(maxHeight: 90.0, minHeight: 35.1),
                isSelected: isSelected,
                selectedColor: Colors.green[900],
                color: Colors.white,
                fillColor: Colors.green.shade300,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                renderBorder: true,
                borderRadius: BorderRadius.circular(4),
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('ar', style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('en', style: TextStyle(fontSize: 18)),
                  ),
                ],
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0; index < isSelected.length; index++) {
                      if (index == newIndex) {
                        context
                            .read<LanguageChangeProvider>()
                            .ChangeLocale("en");
                        isSelected[index] = true;
                      } else {
                        context
                            .read<LanguageChangeProvider>()
                            .ChangeLocale("ar");
                        isSelected[index] = false;
                      }
                    }
                  });
                }),
          ),
        ],
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green.shade500, Colors.green.shade900]),
          ),
        ),
        title: Text(
          S.of(context).title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                S.of(context).tourismIrbid,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
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
        S.of(context).irbidTou,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
