import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/colors_manager.dart';

class AppStyles {
  static  TextStyle screenTitle  = GoogleFonts.inter(
    fontWeight:FontWeight.w400 ,
    fontSize:22 ,
    color: ColorsManager.white,
  );
  static  TextStyle browserCategories  = GoogleFonts.poppins(
    fontWeight:FontWeight.w600 ,
    fontSize:14 ,
    color: ColorsManager.white,
  );
  static  TextStyle filmWatchListTitle  = GoogleFonts.inter(
    fontWeight:FontWeight.w400 ,
    fontSize:15 ,
    color: ColorsManager.white,
  );
  static  TextStyle filmWatchListDescription  = GoogleFonts.inter(
    fontWeight:FontWeight.w400 ,
    fontSize:12 ,
    color: ColorsManager.description,
  );
  static  TextStyle recommandes  = TextStyle(
      color: Colors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold);
  static  TextStyle   newRelease =  TextStyle(
  color: Colors.white,
  fontSize: 18.sp,
  fontWeight: FontWeight.bold);
  static  TextStyle   vote =  TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static  TextStyle   movieTitle =  TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static  TextStyle   moreLikeThis =  TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}