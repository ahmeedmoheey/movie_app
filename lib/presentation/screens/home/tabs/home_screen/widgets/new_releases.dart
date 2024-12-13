import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/home_details.dart';

import '../../../../../../core/constant_manager.dart';

class NewReleases extends StatelessWidget {
  const NewReleases({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          final movie = snapshot.data[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 7.h),
            child: InkWell(
              onTap: () {
                // تمرير المتغير `movie` إلى صفحة التفاصيل
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetails(movie: movie),
                  ),
                );
              },
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 96.87.w,
                        height: 127.74.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                '${ConstantManager.imagePath}${movie.posterPath}'),
                          ),
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_add,
                          color: Color(0xff514F4F).withOpacity(.8),
                          size: 33,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
