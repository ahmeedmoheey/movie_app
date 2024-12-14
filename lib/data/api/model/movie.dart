class Movie {
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  num voteAverage;
  int id;

  Movie(
      {required this.backdropPath,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.id
      });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json["backdrop_path"] ?? '',
      originalLanguage: json["original_language"] ?? 'Unknown',
      originalTitle: json["original_title"] ?? 'No Title',
      overview: json["overview"] ?? 'No overview available',
      posterPath: json["poster_path"] ?? '',
      releaseDate: json["release_date"] ?? 'Unknown Date',
      title: json["title"] ?? 'No Title',
      voteAverage: json["vote_average"] ?? 0.0,
      id: json["id"] ?? 0,
    );
  }
}
