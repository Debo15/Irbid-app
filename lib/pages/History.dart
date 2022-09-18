import 'package:flutter/material.dart';
import 'package:irbid/ImageContainer.dart';
import 'package:irbid/generated/l10n.dart';


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
