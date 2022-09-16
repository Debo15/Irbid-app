import 'package:flutter/material.dart';
import 'package:irbid/Controller.dart';

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
        primaryColor: Colors.green,
        fontFamily: "NotoSans",
      ),
      home: Controller(),
    );
  }
}

//
// Column(
// children: <Widget> [
// Row(
// children: <Widget>[
// Expanded(
// flex: 1,
// child: Container(
// padding: const EdgeInsets.all(10),
// child: OutlinedButton.icon(
// onPressed:  () {  },
// icon: const Icon(Icons.hail, color: Colors.black,),
// style: OutlinedButton.styleFrom(
// side: const BorderSide(width: 2.0, color: Colors.green),
// primary: Colors.green.shade400,
// ),
// label: const Text("الأماكن السياحية", style: TextStyle(color: Colors.black),),
// ),
// ),
// ),
// Expanded(
// flex: 1,
// child: Container(
// padding: const EdgeInsets.all(10.0),
// child: OutlinedButton.icon(
// onPressed: () {  },
// icon: const Icon(Icons.location_city_outlined, color: Colors.black,),
// style: OutlinedButton.styleFrom(
// side: const BorderSide(width: 2.0, color: Colors.green),
// primary: Colors.green.shade400,
// ),
// label: const Text("تاريخ مدينة أربد", style: TextStyle(color: Colors.black),),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: <Widget>[
// Expanded(child: ToggleTourismTypes()),
// ]
// ),
// ]
// ),