import 'package:flutter/material.dart';
import 'package:movie_app/core/colors_manager.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/HomeScreen.dart';
import 'package:movie_app/presentation/screens/home/tabs/search/SearchTab.dart';
import 'package:movie_app/presentation/screens/home/tabs/watch_list/watch_list.dart';
import 'tabs/Browse/browse.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs = [
    HomeScreen(),
    SearchTab(),
    Browse(),
    WatchList(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorsManager.blackAcc,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.7),
              blurRadius: 15,
              offset: const Offset(0, -9),
            ),
          ],
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'SEARCH',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'BROWSE',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'WATCHLIST',
            ),
          ],
        ),
      ),
    );
  }
}
