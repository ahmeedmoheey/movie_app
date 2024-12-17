import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';

import '../../../../../../core/constant_manager.dart';
import '../../../../../../data_model/firebase/firebase.dart';
import '../home_details/home_details.dart';

class Recommended extends StatefulWidget {
  const Recommended({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetails(movie: movie),
                ),
              );
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
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      '${ConstantManager.imagePath}${movie.posterPath}',
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
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
                              style: AppStyles.vote
                            ),
                            SizedBox(width: 40.w),
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  savedMovies[movie.id.toString()] = !isSaved;
                                });
                                await addMovieToFireStore(movie);
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
                          style: AppStyles.movieTitle,
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

  Future<void> addMovieToFireStore(dynamic movie) async {
    try {
      CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('watchlist');

      DocumentReference documentReference =
      collectionReference.doc(movie.id.toString());

      DocumentSnapshot documentSnapshot = await documentReference.get();
      if (!documentSnapshot.exists) {
        MoviesDM movieDM = MoviesDM(
          id: movie.id.toString(),
          title: movie.title ?? 'Unknown Title',
          posterPath: movie.posterPath ?? '',
          releaseDate: movie.releaseDate?.toString() ?? 'Unknown Date',
          voteAverage: movie.voteAverage?.toDouble() ?? 0.0,
          isDone: false,
        );

        await documentReference.set(movieDM.toFireStore());
        debugPrint("Movie added to watchlist successfully.");
      } else {
        debugPrint("Movie already in watchlist.");
      }
    } catch (error) {
      debugPrint("Failed to add movie to watchlist: $error");
    }
  }
}
