class MoviesDM {
  final String id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final bool isDone;

  MoviesDM({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.isDone,
  });

  factory MoviesDM.fromFireStore(Map<String, dynamic> data) {
    return MoviesDM(
      id: data['id'] as String,
      title: data['title'] as String,
      posterPath: data['posterPath'] as String,
      releaseDate: data['releaseDate'] as String,
      voteAverage: (data['voteAverage'] as num).toDouble(),
      isDone: data['isDone'] as bool,
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'isDone': isDone,
    };
  }
}
