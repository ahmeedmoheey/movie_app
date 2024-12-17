import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/core/constant_manager.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/home_details.dart';

class TopSlider extends StatelessWidget {
  const TopSlider({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index, realIndex) {
        final movie = snapshot.data[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetails(movie: movie,),));
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[900],
            ),
            child: Stack(
              children: [

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image:
                         DecorationImage(
                      image: NetworkImage('${ConstantManager.imagePath}${movie.backdropPath}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 50.sp,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 100.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image:
                           DecorationImage(
                          image: NetworkImage('${ConstantManager.imagePath}${movie.posterPath}'),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 16.w,
                  bottom: 10.h,
                  child:  Container(
                    width: 230.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text(
                          movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.movieTitle.copyWith(fontSize: 20.sp)
                          ),
                        SizedBox(height: 8.h),
                        Text(
                          movie.releaseDate,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        );

      },
      options: CarouselOptions(
        height: 200.h,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
    );
  }

}
