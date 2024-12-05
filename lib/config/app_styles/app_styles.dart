import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/colors_manager.dart';

class AppStyles {
  static  TextStyle browserTitle  = GoogleFonts.inter(
    fontWeight:FontWeight.w400 ,
    fontSize:22 ,
    color: ColorsManager.white,
  );
  static  TextStyle browserCategories  = GoogleFonts.poppins(
    fontWeight:FontWeight.w600 ,
    fontSize:14 ,
    color: ColorsManager.white,
  );
}