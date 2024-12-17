import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/core/assets_manager.dart';
import '../home_screen/home_details/movie_details.dart';
import '../../../../../../core/constant_manager.dart';
import '../../../../../../data_model/firebase/firebase.dart';

class WatchList extends StatelessWidget {
  const  WatchList({super.key ,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Watchlist'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('watchlist').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Image.asset(AssetsManager.searchNoMoviesFound));
          }
          final movies = snapshot.data!.docs;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movieData = movies[index].data() as Map<String, dynamic>;
              var movie = MoviesDM.fromFireStore(movieData);
              var movieForDetails = movie.toMovie();

              return ListTile(
                contentPadding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                leading: Image.network(
                  '${ConstantManager.imagePath}${movie.posterPath}',
                  fit: BoxFit.cover,
                  width: 140,
                  height: 89,
                ),
                title: Text(movie.title, style: AppStyles.filmWatchListTitle.copyWith(fontSize: 15)),
                subtitle: Text('Released: ${movie.releaseDate}', style: AppStyles.filmWatchListDescription.copyWith(fontSize: 13)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    deleteMovieFromWatchlist(movie.id);
                  },
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetails(movie: movieForDetails)));
                },
              );
            },
          );
        },
      ),
    );
  }

  void deleteMovieFromWatchlist(String movieId) async {
    try {
      await FirebaseFirestore.instance.collection('watchlist').doc(movieId).delete();
      debugPrint("Movie removed from watchlist.");
    } catch (error) {
      debugPrint("Failed to remove movie from watchlist: $error");
    }
  }
}
