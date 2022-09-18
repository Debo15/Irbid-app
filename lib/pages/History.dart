import 'package:flutter/material.dart';
import 'package:irbid/ImageContainer.dart';
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
        child: Image.asset(
      src,
      width: widthImage,
    ));
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(seconds: 2),
      child: Image.asset(
        "assets/centerCity.jpg",
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
      // right: 20,
      bottom: 10,
      child: Text(S.of(context).irbidGovernorateHistory,
        style: const TextStyle(
          color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
        ),
      ),
      // child: Text(
      //   "تاريخ مدينة إربد",
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontSize: 24,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
    );
  }
}
