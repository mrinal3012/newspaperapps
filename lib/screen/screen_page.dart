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



  int currentTab = 0;
  List<Widget> pages=[
    HomePage(),
    CityPage(),
    PhotoPage(),
    BangladeshTimesPage()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(child: currentScreen),
      floatingActionButton: FloatingActionButton(backgroundColor: Color(0xff2A2A36),
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,size: 35,
                          color:
                          currentTab == 0 ? Colors.redAccent : Colors.black.withOpacity(.5),
                        ),
                        Text("Home",
                          // style: mystyleroboto(16, currentTab == 0 ? Colors.redAccent : Colors.black.withOpacity(.5),FontWeight.w500)
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = CityPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                        Icons.location_city,size: 35,
                          color:
                          currentTab == 1 ? Colors.redAccent  : Colors.black.withOpacity(.5),
                        ),
                        Text("City",
                          // style: mystyleroboto(16, currentTab == 1 ? Colors.redAccent : Colors.black.withOpacity(.5),FontWeight.w500)
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = PhotoPage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo,size: 35,
                          color:
                          currentTab == 2 ? Colors.redAccent  : Colors.black.withOpacity(.5),
                        ),
                        Text("Photo",
                          // style: mystyleroboto(16, currentTab == 2 ? Colors.redAccent : Colors.black.withOpacity(.5),FontWeight.w500)
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = BangladeshTimesPage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                        Icons.newspaper_outlined,size: 35,
                          color:
                          currentTab == 3 ? Colors.redAccent : Colors.black.withOpacity(.5),
                        ),
                        Text("BT",
                          // style: mystyleroboto(16, currentTab == 3 ? Colors.redAccent : Colors.black.withOpacity(.5),FontWeight.w500)
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //
      //     backgroundColor: Colors.blue,
      //     unselectedItemColor: Colors.blueGrey,
      //     selectedItemColor: Colors.black,
      //     currentIndex: _currentIndex,
      //     onTap: (value) {
      //       setState(() {
      //         _currentIndex=value;
      //       });
      //     },
      //
      //     items: [
      //
      //       // BottomNavigationBarItem(
      //       //   icon: Icon(Icons.home,size: 35,),
      //       //   label: "Home",
      //       // ),
      //       // BottomNavigationBarItem(
      //       //   icon: Icon(Icons.location_city,size: 35,),
      //       //   label: "City",
      //       // ),
      //       // BottomNavigationBarItem(
      //       //   icon: Icon(Icons.photo,size: 35),
      //       //   label: "Photo",
      //       // ),
      //       // BottomNavigationBarItem(
      //       //   icon: Icon(Icons.newspaper_outlined,size: 35),
      //       //   label: "BT",
      //       // ),
      //     ]),
    );
  }
}
