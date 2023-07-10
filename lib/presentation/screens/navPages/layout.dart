import 'package:flutter/material.dart';
import 'package:trip_app_cubit/presentation/screens/navPages/bar_items_page.dart';
import 'package:trip_app_cubit/home_page.dart';
import 'package:trip_app_cubit/presentation/screens/navPages/myPage_item_page.dart';
import 'package:trip_app_cubit/presentation/screens/navPages/search_item_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;

  void onTap(int index){
    setState(() {
      currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex:currentIndex ,
        onTap: onTap,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), label: 'Bar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_sharp), label: 'My Page'),
        ],
      ),
    );
  }
}
