import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/core/assets_manager.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 35
        ),
        title:  Text('Dora and the Lost City of Gold',style: AppStyles.screenTitle,),

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section
            Stack(
              children: [
                Container(
                  width: 412.w,
                  height: 217.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsManager.dramaFilm), // Replace with your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.play_circle,
                      size: 60,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Poster Image
                  Container(
                    height: 120.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image:  const DecorationImage(
                        image: AssetImage(AssetsManager.dramaFilm), // Replace with your poster image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Text Details
                   Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dora and the Lost City of Gold',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '2019  PG-13  2h 7m',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.h,),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '7.7',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Action Buttons
            Padding(
              padding:  REdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                      (index) => ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: const Text('Action'),// ????????
                  ),
                ),
              ),
            ),
             SizedBox(height: 16.h),
            // Rating Row

             SizedBox(height: 24.h),
            // More Like This Section
            Padding(
              padding:  REdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'More Like This',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
             SizedBox(height: 16.h),
            buildMoreLikeThis(),
             SizedBox(height: 24.h),
          ],
        ),
      ),

    );

  }
  Widget buildMoreLikeThis() {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w).copyWith(bottom: 16.h), // مسافة إضافية من الأسفل
            width: 150.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[900],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: Image.asset(AssetsManager.crimeFilm,
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: REdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "7.7",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 60.w),
                          InkWell(
                              onTap: () {

                              },
                              child:
                              const Icon(Icons.bookmark_border_outlined,color: Colors.white,))
                        ],
                      ),
                      SizedBox(height: 4.h),

                      Text(
                        "Film Title",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),

                      Text(
                        "2018 R 1h 59m",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}
