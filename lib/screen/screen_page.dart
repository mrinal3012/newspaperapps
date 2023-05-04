import 'package:flutter/material.dart';
import 'package:newspaperapps/screen/bangladesh_times_page.dart';
import 'package:newspaperapps/screen/city_page.dart';
import 'package:newspaperapps/screen/home_page.dart';
import 'package:newspaperapps/screen/photo_page.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {


  int _currentIndex = 0;
  List<Widget> pages=[
    HomePage(),
    CityPage(),
    PhotoPage(),
    BangladeshTimesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(

          backgroundColor: Colors.cyan,
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex=value;
            });
          },

          items: [

            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 35,),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_city,size: 35,),
              label: "City",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo,size: 35),
              label: "Photo",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_outlined,size: 35),
              label: "BT",
            ),
          ]),
    );
  }
}
