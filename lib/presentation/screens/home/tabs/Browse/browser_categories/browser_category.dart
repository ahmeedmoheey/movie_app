import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/data_model/category_dm/category_dm.dart';
import 'package:movie_app/my_application/my_application.dart';
import 'package:movie_app/presentation/screens/home/tabs/Browse/browser_details/browser_details.dart';

class BrowserCategories extends StatelessWidget {
  BrowserCategories({super.key, required this.categoryDM, required this.index});
  CategoryDM categoryDM;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // هنا نمرر categoryDM.id و categoryDM.title عند الانتقال إلى صفحة التفاصيل
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailsPage(
              categoryId: categoryDM.id,  // استخدام categoryDM.id
              categoryTitle: categoryDM.title,  // استخدام categoryDM.title
            ),
          ),
        );
      },
      child: Stack(
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
      ),
    );
  }
}
