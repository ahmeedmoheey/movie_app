import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/movie_details.dart';

import '../../../../../../core/constant_manager.dart';
import '../../../../../../data_model/firebase/firebase.dart';

class NewReleases extends StatefulWidget {
  const NewReleases({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  State<NewReleases> createState() => _NewReleasesState();
}

class _NewReleasesState extends State<NewReleases> {
  Map<String, bool> savedMovies = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.snapshot.data.length,
        itemBuilder: (context, index) {
          final movie = widget.snapshot.data[index];

          bool isSaved = savedMovies[movie.id.toString()] ?? false;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 7.h),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(movie: movie),
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
                        onPressed: () {
                          setState(() {
                            savedMovies[movie.id.toString()] = !isSaved;
                          });
                          addMovieToFireStore(movie);
                        },
                        icon: Icon(
                          size: 33,
                          isSaved
                              ? Icons.bookmark_added
                              : Icons.bookmark_border_outlined,
                          color: isSaved ? Colors.yellow : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
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
