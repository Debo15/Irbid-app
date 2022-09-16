import 'package:flutter/material.dart';
import 'package:irbid/pages/Culture.dart';
import 'package:irbid/pages/Economic.dart';
import 'package:irbid/pages/Education.dart';
import 'package:irbid/pages/Health.dart';
import 'package:irbid/pages/History.dart';
import 'package:irbid/pages/HomePage.dart';
import 'package:irbid/pages/Settings.dart';
import 'package:irbid/pages/Tourism.dart';

class Controller extends StatefulWidget {
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
          backgroundColor: Colors.transparent,
          title: const Text(
            "Irbid | أربد",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
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
                  padding: EdgeInsets.zero,
                  child: Image.asset("assets/irbid_0.jpg")
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      " الصفحة الرئيسية",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.home),
                  ],
                ),
                onTap: (){
                  setState(() => this.index = 0);
                  Navigator.pop(context);
                }
              ),
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
                  onTap: (){
                    setState(() => this.index = 1);
                    Navigator.pop(context);
                  }
              ),
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
                  onTap: (){
                    setState(() => this.index = 2);
                    Navigator.pop(context);
                  }
              ),
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
                  onTap: (){
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
                  onTap: (){
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
                  onTap: (){
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
                  onTap: (){
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
                  onTap: (){
                    setState(() => this.index = 7);
                    Navigator.pop(context);
                  },
              ),
            ],
          ),
        ),
        body: Container(
          child: pages[index],
        ),
      );
}
