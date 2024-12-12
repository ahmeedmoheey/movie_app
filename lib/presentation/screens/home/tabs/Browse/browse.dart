import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/data_model/category_dm/category_dm.dart';
import 'package:movie_app/presentation/screens/home/tabs/Browse/browser_categories/browser_category.dart';
import 'package:movie_app/presentation/screens/home/tabs/Browse/browser_details/browser_details.dart';

class Browse extends StatelessWidget {
  Browse({super.key});

  List<CategoryDM> categoryList = CategoryDM.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          Text(
            'Browse Category ',
            style: AppStyles.screenTitle,
          ),
          SizedBox(height: 5.h),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 20,
              ),
              itemCount: categoryList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                },
                child: BrowserCategories(
                  categoryDM: categoryList[index],
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
