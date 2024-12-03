import 'package:flutter/material.dart';
import 'package:movie_app/core/assets_manager.dart';
import 'package:movie_app/core/routes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, RoutesManager.homeScreen);
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
          child: Image.asset(AssetsManager.movieLogo,
            width: double.infinity,
            height: size.height* 0.22,)),
    );
  }
}
