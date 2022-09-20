import 'package:flutter/material.dart';
import 'package:irbid/pages/Culture.dart';
import 'package:irbid/pages/Economic.dart';
import 'package:irbid/pages/Education.dart';
import 'package:irbid/pages/Health.dart';
import 'package:irbid/pages/History.dart';
import 'package:irbid/pages/HomePage.dart';
import 'package:irbid/pages/Tourism.dart';
import 'package:irbid/widgets/map.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'package:irbid/languageChangeProvider.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  GlobalKey<TourismPageState> globalKey = GlobalKey();
  int index = 0;

  List<Widget> pages = [];

  List<bool> isSelected = [];

  @override
  void initState() {
    pages = [
      const HomePage(),
      const HistoryPage(),
      const CulturePage(),
      const EconomicPage(),
      const EducationPage(),
      TourismPage(key: globalKey),
      const HealthPage(),
    ];
    isSelected = [
      context.read<LanguageChangeProvider>().currentLocale.languageCode == "ar",
      context.read<LanguageChangeProvider>().currentLocale.languageCode == "en"
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      isSelected = [
        context.read<LanguageChangeProvider>().currentLocale.languageCode ==
            "ar",
        context.read<LanguageChangeProvider>().currentLocale.languageCode ==
            "en"
      ];
    });
    globalKey.currentState?.updateLocale();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                  // borderColor: Colors.transparent,
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
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
                    children: <Widget>[
                      Padding(
                        padding: (isSelected[1]
                            ? const EdgeInsets.fromLTRB(0, 0, 8, 0)
                            : const EdgeInsets.fromLTRB(8, 0, 0, 0)),
                        child: const Icon(Icons.home),
                      ),
                      Text(
                        S.of(context).homePage,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() => index = 0);
                    Navigator.pop(context);
                  }),
              ListTile(
                  textColor: Colors.black,
                  iconColor: Colors.green,
                  title: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: (isSelected[1]
                            ? const EdgeInsets.fromLTRB(0, 0, 8, 0)
                            : const EdgeInsets.fromLTRB(8, 0, 0, 0)),
                        child: const Icon(Icons.location_city),
                      ),
                      Text(
                        S.of(context).irbidHis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() => index = 1);
                    Navigator.pop(context);
                  }),
              ListTile(
                  textColor: Colors.black,
                  iconColor: Colors.green,
                  title: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: (isSelected[1]
                            ? const EdgeInsets.fromLTRB(0, 0, 8, 0)
                            : const EdgeInsets.fromLTRB(8, 0, 0, 0)),
                        child: const Icon(Icons.groups),
                      ),
                      Text(
                        S.of(context).irbidCul,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() => index = 2);
                    Navigator.pop(context);
                  }),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: (isSelected[1]
                          ? const EdgeInsets.fromLTRB(0, 0, 8, 0)
                          : const EdgeInsets.fromLTRB(8, 0, 0, 0)),
                      child: const Icon(Icons.data_exploration),
                    ),
                    Text(
                      S.of(context).irbidEco,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() => index = 3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: (isSelected[1]
                          ? const EdgeInsets.fromLTRB(0, 0, 8, 0)
                          : const EdgeInsets.fromLTRB(8, 0, 0, 0)),
                      child: const Icon(Icons.menu_book),
                    ),
                    Text(
                      S.of(context).irbidEdu,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() => index = 4);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: (isSelected[1]
                          ? const EdgeInsets.fromLTRB(0, 0, 8, 0)
                          : const EdgeInsets.fromLTRB(8, 0, 0, 0)),
                      child: const Icon(Icons.connecting_airports_rounded),
                    ),
                    Text(
                      S.of(context).irbidTou,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() => index = 5);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: (isSelected[1]
                          ? const EdgeInsets.fromLTRB(0, 0, 8, 0)
                          : const EdgeInsets.fromLTRB(8, 0, 0, 0)),
                      child: const Icon(Icons.health_and_safety_outlined),
                    ),
                    Text(
                      S.of(context).irbidHeal,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() => index = 6);
                  Navigator.pop(context);
                },
              ),
              // ListTile(
              //   textColor: Colors.black,
              //   iconColor: Colors.green,
              //   title: Row(
              //     // mainAxisAlignment: MainAxisAlignment.end,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: const [
              //       Text(
              //         "أعدادت التطبيق",
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       Icon(Icons.settings),
              //     ],
              //   ),
              //   onTap: () {
              //     setState(() => this.index = 7);
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(0),
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
      // right: 20,
      bottom: 5,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            S.of(context).title, //Irbid
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: (isSelected[1]
                ? const EdgeInsets.fromLTRB(8, 0, 0, 0)
                : const EdgeInsets.fromLTRB(0, 0, 8, 0)),
            child: Text(
              S.of(context).dance, //Arous Al-shamal
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
