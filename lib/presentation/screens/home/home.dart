import 'package:flutter/material.dart';
import 'package:movie_app/core/colors_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {

        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
              backgroundColor: ColorsManager.bottomNavBar),
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
    );
  }
}
