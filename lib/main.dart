import 'package:flutter/material.dart';
import 'package:irbid/sideBar.dart';
import 'package:irbid/toggleMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NotoSans",
      ),
      home: Scaffold(
        drawer: Drawer(

          child: ListView(
            padding: EdgeInsets.zero,

            children: [
              DrawerHeader(

                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: 
                Expanded(
                    child: Stack(
                        children: <Widget>[
                          Image.asset("assets/irbid_0.jpg",),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: const <Widget>[
                          //     Expanded(child: Text("IRBID"), flex: 1,),
                          //     Expanded(child: Text("أربد"), flex: 1,)
                          //   ]
                          // )
                        ]
                    )
                )
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ Text(" الصفحة الرئيسية", style: TextStyle(fontWeight: FontWeight.bold,),), Icon(Icons.home),],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [ Text(" مدينة أربد وتاريخها", style: TextStyle(fontWeight: FontWeight.bold,),), Icon(Icons.location_city),],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [ Text(" الثقافة في أربد", style: TextStyle(fontWeight: FontWeight.bold,),), Icon(Icons.groups),],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [ Text("الأقتصاد في أربد", style: TextStyle(fontWeight: FontWeight.bold,),), Icon(Icons.data_exploration),],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [ Text("التعليم في أربد", style: TextStyle(fontWeight: FontWeight.bold,),), Icon(Icons.menu_book),],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [ Text("السياحة في أربد", style: TextStyle(fontWeight: FontWeight.bold,),), Icon(Icons.connecting_airports_rounded),],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [ Text("القطاع الصحي في أربد", style: TextStyle(fontWeight: FontWeight.bold,),), Icon(Icons.health_and_safety_outlined),],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                textColor: Colors.black,
                iconColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [ Text("أعدادت التطبيق", style: TextStyle(fontWeight: FontWeight.bold,),), Icon(Icons.settings),],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Irbid | أربد",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
            children: <Widget> [
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: OutlinedButton.icon(
                        onPressed:  () {  },
                        icon: const Icon(Icons.hail, color: Colors.black,),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 2.0, color: Colors.green),
                          primary: Colors.green.shade400,
                        ),
                        label: const Text("الأماكن السياحية", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: OutlinedButton.icon(
                        onPressed: () {  },
                        icon: const Icon(Icons.location_city_outlined, color: Colors.black,),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 2.0, color: Colors.green),
                          primary: Colors.green.shade400,
                        ),
                        label: const Text("تاريخ مدينة أربد", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
              ],
            ), 
            Row(
                children: <Widget>[
                  Expanded(child: ToggleTourismTypes()),
                ]
            ),
          ]
        ),
      ),
    );
  }
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
