import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_theme/app_theme.dart';
import 'package:movie_app/presentation/screens/home/tabs/Browse/browser_details/browser_details.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/movie_details.dart';

import '../core/routes_manager.dart';
import '../presentation/screens/home/home.dart';
import '../splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
      routes: {
        RoutesManager.splashScreen : (_) =>  const SplashScreen(),
        RoutesManager.homeScreen : (_) => Home(),
        RoutesManager.homeDetails : (_) =>  MovieDetails(),
      },
      initialRoute:RoutesManager.splashScreen ,

      ),

    );
  }
}
