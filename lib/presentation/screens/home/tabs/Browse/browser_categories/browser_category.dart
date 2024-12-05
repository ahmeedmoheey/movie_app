import 'package:flutter/material.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/data_model/category_dm/category_dm.dart';

class BrowserCategories extends StatelessWidget {
   BrowserCategories({super.key, required this.categoryDM, required this.index});
   CategoryDM categoryDM;
   int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
     alignment: Alignment.center,
      children: [
        Image.asset(
         categoryDM.imagePath,
          width: 158,
          height: 90,
        ),
        Text(categoryDM.title,
        style: AppStyles.browserCategories,)

      ],
    );
  }
}
