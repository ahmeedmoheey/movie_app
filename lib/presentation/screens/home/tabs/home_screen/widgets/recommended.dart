import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant_manager.dart';
import '../home_details/home_details.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          final movie = snapshot.data[index];

          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetails(),));

            },
            child: Container(
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      '${ConstantManager.imagePath}${movie.posterPath}', // رابط الصورة
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit. fill,
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
                            SizedBox(width: 2.w),
                            Text(
                              "${movie.voteAverage.toStringAsFixed(1)}/10",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 40.w),
                            InkWell(
                                onTap: () {

                                },
                                child:
                                Icon(Icons.bookmark_border_outlined,color: Colors.white,))
                          ],
                        ),
                        SizedBox(height: 4.h),

                        Text(
                          movie.title,
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
                          movie.releaseDate,
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
            ),
          );
        },
      ),
    );;
  }
}
