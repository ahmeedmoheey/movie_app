import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/core/assets_manager.dart';
import 'package:movie_app/core/colors_manager.dart';
import 'package:movie_app/core/constant_manager.dart';
import 'package:movie_app/data/api/api_manager/api.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/widget/more_like_this.dart';
import '../../../../../../data/api/model/movie.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({
    super.key,
    this.movie,
  });

  final Movie? movie;

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  late Future<List<Movie>> similarMovies;

  @override
  void initState() {
    super.initState();
      similarMovies = Api().similarMovies(widget.movie!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
        title: Text(
          widget.movie!.title,
          style: AppStyles.screenTitle,
        ),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          '${ConstantManager.imagePath}${widget.movie?.backdropPath ?? ''}'),
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
                      image: DecorationImage(
                        image: NetworkImage(
                            '${ConstantManager.imagePath}${widget.movie?.posterPath ?? ''}'),
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
                          widget.movie?.title ?? 'No Title',
                          style: const  TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          widget.movie?.releaseDate ?? 'No Release Date',
                          style: const  TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          widget.movie?.overview ?? 'No Overview',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                           const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                           const  SizedBox(width: 4),
                            Text(
                              '${widget.movie?.voteAverage.toStringAsFixed(1) ?? '0'}/10',
                              style: const TextStyle(
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                      (index) => ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: const Text('Action'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // Rating Row
            SizedBox(height: 24.h),
            // More Like This Section
              Padding(
              padding: const  EdgeInsets.symmetric(horizontal: 16.0),
              child:  Text(
                'More Like This',
                style: AppStyles.moreLikeThis
              ),
            ),
            SizedBox(height: 16.h),
            FutureBuilder(
              future: similarMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}', style:  TextStyle(color: ColorsManager.white)),
                  );
                } else if (snapshot.hasData) {
                  return MoreLikeThis(snapshot: snapshot);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

}
