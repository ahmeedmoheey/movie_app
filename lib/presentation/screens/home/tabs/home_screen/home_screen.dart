import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routes_manager.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/home_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeDetails()));
               },
              child: CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) => buildSliderItem(
                    title: "Film Title ",
                    releaseDate: "2024",
                    imageUrl:
                        'https://compote.slate.com/images/22ce4663-4205-4345-8489-bc914da1f272.jpeg?crop=1560%2C1040%2Cx0%2Cy0'),
                itemCount: 5,
                options: CarouselOptions(
                  height: 200.h,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                ),
              ),
            ),

            SizedBox(height: 30.h),

            //  New Releases
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('New Releases',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20.h),
            buildNewReleases(),

            SizedBox(height: 30.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('Recommended',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20.h),
            buildRecommended(),
          ],
        ),
      ),
    );
  }


  Widget buildSliderItem(
      {required String title, String? releaseDate, String? imageUrl}) {
    return Container(
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
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle_fill, //
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
                  image: imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: Colors.black, // لون مؤقت للصورة
                ),
              ),
            ),
          ),

          Positioned(
            right: 16.w,
            bottom: 10.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  releaseDate ?? "Unknown Release Date",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //    (New Releases وRecommended)
  Widget buildNewReleases() {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 7.h),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 96.87.w,
                      height: 127.74.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(fit: BoxFit.cover,image: NetworkImage('https://compote.slate.com/images/22ce4663-4205-4345-8489-bc914da1f272.jpeg?crop=1560%2C1040%2Cx0%2Cy0')),
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_add,color: Color(0xff514F4F).withOpacity(.8),size: 33,))
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
  Widget buildRecommended() {
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    'https://compote.slate.com/images/22ce4663-4205-4345-8489-bc914da1f272.jpeg?crop=1560%2C1040%2Cx0%2Cy0', // رابط الصورة
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
                          Icon(Icons.bookmark_border_outlined,color: Colors.white,))
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
