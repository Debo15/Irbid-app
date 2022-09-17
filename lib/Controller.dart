import 'package:flutter/material.dart';
import 'package:irbid/languageChangeProvider.dart';
import 'package:irbid/pages/Culture.dart';
import 'package:irbid/pages/Economic.dart';
import 'package:irbid/pages/Education.dart';
import 'package:irbid/pages/Health.dart';
import 'package:irbid/pages/History.dart';
import 'package:irbid/pages/HomePage.dart';
import 'package:irbid/pages/Settings.dart';
import 'package:irbid/pages/Tourism.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  int index = 0;

  final pages = [
    HomePage(),
    HistoryPage(),
    CulturePage(),
    EconomicPage(),
    EducationPage(),
    TourismPage(),
    HealthPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(48.0),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(onPressed: (){
              context.read<LanguageChangeProvider>().ChangeLocale("ar");
            }, child: Text("Arabic")),
            ElevatedButton(onPressed: (){
              context.read<LanguageChangeProvider>().ChangeLocale("en");
            }, child: Text("English")),

          ],
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.green.shade500, Colors.green.shade900]),
            ),
          ),
          title: const Text(
            "إربد",
            style: TextStyle(
              fontSize: 20,

              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff003000),
                  ),
                  padding: EdgeInsets.zero,
                  child: Stack(

                    children: [
                      _buildParallaxBackground(context),
                      _buildGradient(),
                      _buildTitleAndSubtitle(),
                    ],
                  ),
              ),
              ListTile(
                  textColor: Colors.black,
                  iconColor: Colors.green,
                  title: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                      const Icon(Icons.home),
                      Text(S.of(context).test,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() => this.index = 0);
                    Navigator.pop(context);
                  }),
              ListTile(
                  textColor: Colors.black,
                  iconColor: Colors.green,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        " مدينة أربد وتاريخها",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.location_city),
                    ],
                  ),
                  onTap: () {
                    setState(() => this.index = 1);
                    Navigator.pop(context);
                  }),
              ListTile(
                  textColor: Colors.black,
                  iconColor: Colors.green,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        " الثقافة في أربد",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.groups),
                    ],
                  ),
                  onTap: () {
                    setState(() => this.index = 2);
                    Navigator.pop(context);
                  }),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "الأقتصاد في أربد",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.data_exploration),
                  ],
                ),
                onTap: () {
                  setState(() => this.index = 3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "التعليم في أربد",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.menu_book),
                  ],
                ),
                onTap: () {
                  setState(() => this.index = 4);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "السياحة في أربد",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.connecting_airports_rounded),
                  ],
                ),
                onTap: () {
                  setState(() => this.index = 5);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "القطاع الصحي في أربد",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.health_and_safety_outlined),
                  ],
                ),
                onTap: () {
                  setState(() => this.index = 6);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "أعدادت التطبيق",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.settings),
                  ],
                ),
                onTap: () {
                  setState(() => this.index = 7);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: pages[index],
        ),
      );

  Widget _buildParallaxBackground(BuildContext context) {
    return Image.asset(
      "assets/irbid_0.jpg",
      fit: BoxFit.cover,
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

      right: 20,
      bottom: 10,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            "إربد",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "عروس الشمال",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

