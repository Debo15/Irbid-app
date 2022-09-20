import 'package:flutter/material.dart';
import 'package:irbid/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override

  State<MyStatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<MyStatefulWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                _buildParallaxBackground(context),
                _buildGradient(),
                _buildTitleAndSubtitle(),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(S.of(context).introIrbid,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/CI.png", width: 80, height: 80),
                Image.asset("assets/IrbidCCI.jpg", width: 80, height: 80),
                Image.asset("assets/JUSTI.png", width: 120, height: 80),
            ],)
          ],
        ),
      ),
    );
  }


  Widget _buildParallaxBackground(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(seconds: 2),
      child: Image.asset(
        "assets/irbidGreen.jpg",
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

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      bottom: 10,
      child: Text(S.of(context).aboutIrbidCity,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
