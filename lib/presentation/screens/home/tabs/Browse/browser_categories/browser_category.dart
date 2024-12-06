import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/data_model/category_dm/category_dm.dart';
import 'package:movie_app/my_application/my_application.dart';

class BrowserCategories extends StatelessWidget {
  BrowserCategories({super.key, required this.categoryDM, required this.index});
  CategoryDM categoryDM;
  int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
          child: Image.asset(
            categoryDM.imagePath,
            width: 158.w,
            height: 90.h,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          categoryDM.title,
          style: AppStyles.browserCategories.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
