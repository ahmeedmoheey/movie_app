import 'package:movie_app/data/top_section/result.dart';


class Movie {
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;

  Movie({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,});

  Movie.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}
