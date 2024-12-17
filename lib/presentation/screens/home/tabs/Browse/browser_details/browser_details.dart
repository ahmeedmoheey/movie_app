import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/core/constant_manager.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/home_details.dart';
import '../../../../../../data/api/api_manager/api.dart';
import '../../../../../../data/api/model/movie.dart';

class CategoryDetailsPage extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryDetailsPage({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
  });

  @override
  _CategoryDetailsPageState createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  late Future<List<Movie>> _movies;

  @override
  void initState() {
    super.initState();
    _movies = Api().getMoviesByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle, ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0.w),
        child: FutureBuilder<List<Movie>>(
          future: _movies,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                  )
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return  const Center(
                child: Text(
                  'No movies found',
                ),
              );
            } else {
              final movies = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.65,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return _buildMovieCard(movie);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetails(movie: movie,),));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(
                  '${ConstantManager.imagePath}${movie.posterPath}',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>  const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  movie.title,
                  style: AppStyles.filmWatchListTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
