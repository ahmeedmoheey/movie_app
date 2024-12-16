import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/core/assets_manager.dart';
import 'package:movie_app/core/routes_manager.dart';
import 'package:movie_app/data/api/model/movie.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/home_details.dart';

import '../../../../../../core/constant_manager.dart';
import '../../../../../../data_model/firebase/firebase.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Watchlist'),
        backgroundColor: Colors.black,
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
              return ListTile(
                contentPadding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                leading: Image.network(
                  '${ConstantManager.imagePath}${movie.posterPath}',
                  fit: BoxFit.cover,
                  width: 140,
                  height: 89,
                ),
                title: Text(movie.title,style: AppStyles.filmWatchListTitle.copyWith(fontSize: 15)),
                subtitle: Text('Released: ${movie.releaseDate}',style: AppStyles.filmWatchListDescription.copyWith(fontSize: 13),),
                trailing: IconButton(
                  icon:   const Icon(Icons.delete),
                  onPressed: () {
                    deleteMovieFromWatchlist(movie.id);
                  },

                ),
                onTap: () {
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
