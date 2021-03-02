import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:virus/homepage.dart';
import 'package:virus/pages/countries.dart';
import 'package:virus/pages/firstaid.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';


class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final controller =ScrollController();
  String _title;
  int currentPage = 0;
  final _pageOptions = [HomePage(), CountriesData(), Charts()];
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  // ignore: must_call_super
  initState() {
    _title = 'Covid-19 Updates';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Color(0xFFffcccb) ,
        appBar: ScrollAppBar(
          backgroundColor:  Color(0xFFb61827),
          controller: controller,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
          // flexibleSpace: Image(
          //   image:
          //       AssetImage('assets/COVID-19-pathology-samples-750x500.jpg'),
          //   fit: BoxFit.scaleDown,
          // ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            _title.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: _pageOptions[currentPage],
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   // colors: [Color(0xFF6ebfb0), Color(0xFF6ebfb0)],
          // )),
        ),

        bottomNavigationBar: FancyBottomNavigation(
          circleColor: Colors.white,
          activeIconColor:Color(0xFFb61827) ,
          // barBackgroundColor: Color(0xFF6bbcb2),
          barBackgroundColor: Color(0xFFb61827),
          inactiveIconColor: Colors.grey,
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.flag, title: "Countries"),
            TabData(iconData: Icons.pie_chart, title: "Analysis")
          ],
          onTabChangedListener: (int position) {
            onTabTapped(position);
            // setState(() {
            currentPage = position;
            // });
          },
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentPage = index;
      switch (index) {
        case 0:
          {
            _title = 'Covid-19 Updates';
          }
          break;
        case 1:
          {
            _title = 'Countries';
          }
          break;
        case 2:
          {
            _title = 'Analysis';
          }
          break;
      }
    });
  }
}
