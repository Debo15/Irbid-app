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
        child: Image.asset(
      src,
      width: widthImage,
    ));
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(seconds: 2),
      child: Image.network(
        ////
        // iyad if you put an image slider then no need for an intro photo just the slider
        ////
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
