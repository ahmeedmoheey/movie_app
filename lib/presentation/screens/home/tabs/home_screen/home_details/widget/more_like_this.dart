import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/movie_details.dart';

import '../../../../../../../core/assets_manager.dart';
import '../../../../../../../core/constant_manager.dart';
import '../../../../../../../data_model/firebase/firebase.dart';

class MoreLikeThis extends StatefulWidget {
  const MoreLikeThis({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  _MoreLikeThisState createState() => _MoreLikeThisState();
}

class _MoreLikeThisState extends State<MoreLikeThis> {
  Map<String, bool> savedMovies = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.snapshot.data.length,
        itemBuilder: (context, index) {
          final movie = widget.snapshot.data[index];

          bool isSaved = savedMovies[movie.id.toString()] ?? false;

          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie: movie,),));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w).copyWith(bottom: 16.h),
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
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: Image.network(
                      movie.posterPath != null && movie.posterPath.isNotEmpty
                          ? '${ConstantManager.imagePath}${movie.posterPath}'
                          : '${ConstantManager.defaultImage}',
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
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
                                setState(() {
                                  savedMovies[movie.id.toString()] = !isSaved;
                                });
                                addMovieToFireStore(movie);
                              },
                              child: Icon(
                                isSaved
                                    ? Icons.bookmark_added
                                    : Icons.bookmark_border_outlined,
                                color: isSaved ? Colors.yellow : Colors.white,
                              ),
                            ),
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
    );
  }

  void addMovieToFireStore(dynamic movie) async {
    try {
      CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('watchlist');

      DocumentReference documentReference =
      collectionReference.doc(movie.id.toString());

      MoviesDM movieDM = MoviesDM(
        id: movie.id.toString(),
        title: movie.title,
        posterPath: movie.posterPath,
        releaseDate: movie.releaseDate,
        voteAverage: movie.voteAverage,
        isDone: false,
      );

      await documentReference.set(movieDM.toFireStore());

      debugPrint("Movie added to watchlist successfully.");
    } catch (error) {
      debugPrint("Failed to add movie to watchlist: $error");
    }
  }
}
