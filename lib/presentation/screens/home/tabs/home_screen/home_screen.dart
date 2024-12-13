import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routes_manager.dart';
import 'package:movie_app/data/api/api_manager/api.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/home_details.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/widgets/new_releases.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/widgets/recommended.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/widgets/top_slider.dart';

import '../../../../../data/api/model/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> newReleasesMovies;
  late Future<List<Movie>> recommendedMovies;
@override
  void initState() {
    super.initState();
    popularMovies = Api().getPopularMovies();
    newReleasesMovies = Api().getNewReleasesMovies();
    recommendedMovies = Api().recommendedMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),

             FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return  TopSlider(snapshot: snapshot,);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),



            SizedBox(height: 30.h),

            //  New Releases
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('New Releases',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20.h),

            FutureBuilder(
                future: newReleasesMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return  NewReleases(snapshot: snapshot,);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),

            SizedBox(height: 30.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('Recommended',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20.h),
            FutureBuilder(
              future: recommendedMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return  Recommended(snapshot: snapshot,);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }


  //    (New Releases وRecommended)

}