import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/assets_manager.dart';
import 'package:movie_app/core/colors_manager.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white30),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: ColorsManager.searchBar,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0.r),
                  borderSide: BorderSide(color: Colors.white70)
                )
              ),
              style: TextStyle(color: Colors.white),
            ),
           
            Expanded(child: Image(image: AssetImage(AssetsManager.searchNoMoviesFound)))

          ],
        ),
      ),
    );
  }
}
